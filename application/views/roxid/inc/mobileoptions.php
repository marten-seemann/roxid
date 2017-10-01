<?php
foreach($aLang as $var => $value) {
  if($var == "SHOP_THEME_sThumbnailsize" OR $var == "SHOP_THEME_sDefaultImageQuality" OR $var == "SHOP_THEME_sCatThumbnailsize" OR $var == "SHOP_THEME_sCatIconsize") {
    $aLang[$var."Phone"] = $value;
  }
}
