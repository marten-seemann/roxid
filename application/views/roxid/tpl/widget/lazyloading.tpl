[{*oxscript include="js/libs/jquery.lazyload.js"*}]
[{oxscript add=" /* activate lazy loading of images */
    $(window).bind('load', function() {
        $('img.lazy').lazyLoader();
    });
"}]
