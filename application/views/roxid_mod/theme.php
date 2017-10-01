<?php
/**
 *    This file is part of the ROXID Template - a responsive template for OXID.
 *
 * @link      http://www.oxid-responsive.com
 */

/**
 * Theme Information
 */

require(dirname(__FILE__)."/../roxid/inc/versions.php");


$aTheme = array(
    'id'           => 'roxid_mod',
    'title'        => '<span style=\'letter-spacing:0.07em\'><strong style=\'color: #84AA4C;\'>R</strong>OXID</span> Child-Theme',
    'description'  => '
      <p>your modifications for ROXID One</p>
      <p>For compiling your LESS files click <a href="../modules/roxid/asset_compiler/" target="_blank"><strong>HERE</strong></a>.</p><br>
      ',
    'thumbnail'    => 'theme.png',
    'version'      => '1.0',
    'author'       => '',
    'parentTheme'  => 'roxid',
    'parentVersions' => $roxidVersions
);
