# Asset handling explained

*build/asset_compressor.sh*

* combines all OXID js files into *combined_oxid.js*
* builds *bootstrap.js* from the individual Bootstrap JavaScript files, excluding several unused Bootstrap features
* combines jQuery, jQuery UI and Bootstrap into *jquery-jqueryui-bootstrap.min.js*
* combines all jQuery plugins that are only needed on product pages into a separate library file *libs_all_productpage.js*
* combines all other jQuery plugins, and Modernizr files and other JavaScript libraries into *libs_all.js*
* combines all jQuery plugins CSS code and other JavaScript library CSS code into *libs_all.css*

After this, *oxid.css*, *theme_xxx.css* and *bootstrap_xxx.css* are still uncompressed. This needs to be the case in the development version, however for the productive version, it would be fortunate to compress them, too.
This is done in *build/build.sh* when building the productive version.

Thus, the OXID productive mode will **only** work when using a ROXID productive version!


# Responsive images explained
Depending on the device the site is viewed with the images are delivered in different resolutions and JPEG compression qualities. The image dimensions and the quality can be configured individually via the OXID backend.
For this purpose the *.htaccess* has to be modified such that all image requests are redirected to a custom script, via the following code:

    RewriteRule (\.jpe?g|\.gif|\.png)$ core/utils/roxid_getimg.php

Additionaly, the ROXID Images module has to be activated. It basically works like this:

* a JavaScript sets a cookie containing the resolution of the device
* this cookie is read by the module, and the device is detected (in the *roxidOxConfig* class)
* the *roxidOxConfig* catches every *getConfigParam()* function call and replaces the name of the config parameter to query the image dimensions configured in the database.

This dimension cookie can also be used to hide stuff in *.tpl* files, e.g. the sidebar on smartphones and some sections on product pages (also bought, related products).
This has one downside: it does not work on the first page visit, since the cookie is not present yet. Thus, on the first page would be loaded even on smartphones. To save this bandwidth on the (important) first impression, the HTML code of the sidebar is saved into a JavaScript variable, and only inserted into a DOM, if *Modernizr.mq* detects that a device larger than a smartphone is accessing the page.

For this purpose, the script *widget/conditional_content.tpl* has to be called. It only needs two parameters: the HTML code to insert and the element where the code should be appended. This script assures using the method described above, that the code will only be present if the device is not a smartphone.

## Additional device detection
On pages where the device detection with the self-written module is not possible, a JavaScript method can be applied. The *zDeviceDetect* jQuery plugin handles the device detection using *Modernizr.mq* media queries.


# SQL installation files
The base SQL install file is *sql/install-base.sql*. If database modifications are to be made for later versions, these changes must not be written into this base SQL file, but into an update SQL file, named e.g. *sql/update-v1.2-to-v1.3.sql*.

The build script creates an installation SQL file by concatenating the base SQL file and all update SQL files (in alphabetical order). This file can then be used for all new ROXID installations. For updating old ROXIDs, one just has to use the corresponding update SQL files.


# Plugins
## Modernizr

* Touch Events
* html5shiv
* Modernizr.load
* Media Queries
* Add CSS Classes
* Flexible Box Model (flexbox)

Make sure to activate the Modernizr.prefixed() extensibility (needed for jQuery Sky Carousel).


## jQuery UI

select the following:
* UI Core, Widget
* No Theme
