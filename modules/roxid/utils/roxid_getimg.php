<?php
// Checks if instance name getter does not exist
if ( !function_exists( "getGeneratorInstanceName" ) ) {
  /**
  * Returns image generator instance name
  *
  * @return string
  */
  function getGeneratorInstanceName() {
    return "roxiddynimggenerator";
  }
}

$dirname = dirname(__FILE__);
//* BEGIN DEV *//
// include the file from the current oxbasedir, even if the roxid_getimg.php might be symlinked
// probably only the case in dev environment
// thus removed by build script for productive environment
function canonicalize($address) {
  $address = explode('/', $address);
  $keys = array_keys($address, '..');

  foreach($keys AS $keypos => $key) {
    array_splice($address, $key - ($keypos * 2 + 1), 2);
  }

  $address = implode('/', $address);
  $address = str_replace('./', '', $address);
  return $address;
}

$dirname = canonicalize(dirname($_SERVER['SCRIPT_FILENAME']));
//* END DEV *//
require_once($dirname."/../../../core/oxdynimggenerator.php");


$file = dirname(__FILE__)."/../../responsive_slider/utils/getimg.php";
if(file_exists($file)) {
  require(dirname(__FILE__)."/../../responsive_slider/utils/getimg.php");
}
else {
  class sliderdynimggenerator extends oxdynimggenerator { }
}

class roxiddynimggenerator extends sliderdynimggenerator {
  public function outputImage() {
    foreach($this->_aConfParamToPath as $var => $value) {
      $this->_aConfParamToPath[$var."Phone"] = $value;
    }
    parent::outputImage();
  }

  public function _getImageUri() {
    $uri = parent::_getImageUri();
    $path_parts = pathinfo($uri);
    // var_dump($path_parts);
    // die;
    $filename = $path_parts['filename'];

    if(substr($filename, -3) == "@2x") {
      $ext = $path_parts['extension'];
      $path = $path_parts['dirname'];

      $dir = substr($path, strrpos($path, "/")+1);
      $values = explode("_", $dir);
      $quality = $values[2];
      $new_path = substr($path, 0, strrpos($path, "/")+1).(2*$values[0])."_".(2*$values[1])."_".$quality;
      $uri = $new_path."/".str_replace("@2x", "", $filename).".".$ext;
    }

    return $uri;
  }

  /**
  * adjust image quality for retina images
  *
  * in general, retina images can be compressed very much (by lowering the JPEG quality)
  * this function reduces the quality of the image, but only if the image generated for the retina device is actually an image with a higher resolution
  * example: if the original image has dimensions 100x100, and the (retina) image requested has dimensions 200x200, OXID will still generate a 100x100 picture. Of course, in this case the quality must not be lowered!
  */
  public function _generateImage( $sImageSource, $sImageTarget ) {
    $request_uri = parent::_getImageUri();
    // only for retina images
    if(strpos($request_uri, "@2x") !== false) {
      $source_path_parts = pathinfo($sImageSource);
      $target_path_parts = pathinfo($sImageTarget);

      $target_lastdir = substr($target_path_parts['dirname'], strrpos($target_path_parts['dirname'], "/")+1);
      $target_lastdir_parts = explode("_", $target_lastdir);
      $target_width = $target_lastdir_parts[0];
      $target_height = $target_lastdir_parts[1];
      $target_quality = $target_lastdir_parts[2];

      $source_imagesize = getimagesize($sImageSource);
      $source_width = $source_imagesize[0];
      // $source_height = $source_imagesize[1];

      // image quality will be reduced by $factor
      $factor = 1;
      if($source_width > $target_width) $factor = 1.75;

      $sImageTarget = substr($target_path_parts['dirname'], 0, strrpos($target_path_parts['dirname'], "/")+1) . $target_width . "_" . $target_height . "_" . intval($target_quality / $factor)."/". $target_path_parts['basename'];

      $path = parent::_generateImage( $sImageSource, $sImageTarget );
      $new_path = parent::_getShopBasePath().parent::_getImageUri();
      if(!is_dir(dirname($new_path))) mkdir(dirname($new_path));
      rename($path, $new_path);
      return $new_path;
    }
    else {
      return parent::_generateImage( $sImageSource, $sImageTarget );
    }
  }

  /**
   * Checks if main folder matches requested
   *
   * @param string $sPath image path name to check
   *
   * @return bool
   */
  protected function _isValidPath( $sPath )
  {
      $blValid = false;

      list( $iWidth, $iHeight, $sQuality ) = $this->_getImageInfo();
      if ( $iWidth && $iHeight && $sQuality ) {

          $oConfig = getConfig();
          $oDb = oxDb::getDb( oxDb::FETCH_MODE_ASSOC );

          // parameter names
          $sNames = '';
          foreach ( $this->_aConfParamToPath as $sParamName => $sPathReg ) {
              if ( preg_match( $sPathReg, $sPath ) ) {
                  if ( $sNames ) {
                      $sNames .= ", ";
                  }
                  $sNames .= $oDb->quote( $sParamName );

                  if ( $sParamName == "sManufacturerIconsize" || $sParamName == "sCatIconsize" ) {
                      $sNames .= ", " . $oDb->quote( "sIconsize" );
                  }
              }
          }

          // any name matching path?
          if ( $sNames ) {

              $sDecodeField = $oConfig->getDecodeValueQuery();

              // selecting shop which image quality matches user given
              $sQ = "select oxshopid from oxconfig where (oxvarname = 'sDefaultImageQuality' or oxvarname = 'sDefaultImageQualityPhone')";

              $aShopIds = $oDb->getAll( $sQ );

              // building query:
              // shop id
              $sShopIds = '';
              foreach ( $aShopIds as $aShopId ) {

                  // probably here we can resolve and check shop id to shorten check?


                  if ( $sShopIds ) {
                      $sShopIds .= ", ";
                  }
                  $sShopIds .= $oDb->quote( $aShopId["oxshopid"] );
              }

              // any shop matching quality
              if ( $sShopIds ) {

                  //
                  $sCheckSize1 = "$iWidth*$iHeight";
                  $sCheckSize2 = intval($iWidth/2)."*".intval($iHeight/2); // for retina images

                  // selecting config variables to check
                  $sQ = "select oxvartype, {$sDecodeField} as oxvarvalue from oxconfig
                         where oxvarname in ( {$sNames} ) and oxshopid in ( {$sShopIds} ) order by oxshopid";

                  $aValues = $oDb->getAll( $sQ );
                  foreach ( $aValues as $aValue ) {
                      $aConfValues = (array) $oConfig->decodeValue( $aValue["oxvartype"], $aValue["oxvarvalue"] );
                      foreach ( $aConfValues as $sValue ) {
                          if ( strcmp( $sCheckSize1, $sValue ) == 0 ) {
                              $blValid = true;
                              break;
                          }
                          if ( strcmp( $sCheckSize2, $sValue ) == 0 ) {
                              $blValid = true;
                              break;
                          }
                      }
                  }
              }
          }
      }
      return $blValid;
  }

}
require_once getShopBasePath()."getimg.php";
