[{* Important ! render page head and body to collect scripts and styles *}]
[{capture append="oxidBlock_pageHead"}]
    <meta http-equiv="Content-Type" content="text/html; charset=[{$oView->getCharSet()}]">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>[{block name="head_title"}][{$oView->getPageTitle()}][{/block}]</title>


    [{block name="head_meta_robots"}]
        [{if $oView->noIndex() == 1 }]
            <meta name="ROBOTS" content="NOINDEX, NOFOLLOW">
        [{elseif $oView->noIndex() == 2 }]
            <meta name="ROBOTS" content="NOINDEX, FOLLOW">
        [{/if}]
    [{/block}]

    [{block name="head_meta_description"}]
        [{if $oView->getMetaDescription()}]
            <meta name="description" content="[{$oView->getMetaDescription()}]">
        [{/if}]
    [{/block}]

    [{block name="head_meta_keywords"}]
        [{if $oView->getMetaKeywords()}]
            <meta name="keywords" content="[{$oView->getMetaKeywords()}]">
        [{/if}]
    [{/block}]

    [{block name="head_meta_open_graph"}]
        [{if $oViewConf->getFbAppId()}]
            <meta property="og:site_name" content="[{$oViewConf->getBaseDir()}]">
            <meta property="fb:app_id" content="[{$oViewConf->getFbAppId()}]">
            <meta property="og:title" content="[{ $_sMetaTitlePrefix }][{if $_sMetaTitlePrefix && $_sMetaTitle }] | [{/if}][{$_sMetaTitle|strip_tags}][{if $_sMetaTitleSuffix && ($_sMetaTitlePrefix || $_sMetaTitle) }] | [{/if}][{$_sMetaTitleSuffix}] [{if $_sMetaTitlePageSuffix }] | [{ $_sMetaTitlePageSuffix }] [{/if}]">
            [{if $oViewConf->getActiveClassName() == 'details' }]
                <meta property="og:type" content="product">
                <meta property="og:image" content="[{$oView->getActPicture()}]">
                <meta property="og:url" content="[{$oView->getCanonicalUrl()}]">
            [{else}]
                <meta property="og:type" content="website">
                <meta property="og:image" content="[{$oViewConf->getImageUrl('basket.png')}]">
                <meta property="og:url" content="[{$oViewConf->getCurrentHomeDir()}]">
            [{/if}]
        [{/if}]
    [{/block}]

    [{assign var="canonical_url" value=$oView->getCanonicalUrl()}]
    [{block name="head_link_canonical"}]
        [{if $canonical_url }]
            <link rel="canonical" href="[{ $canonical_url }]">
        [{/if}]
    [{/block}]

    [{block name="head_link_favicon"}]
        [{include file="layout/favicon.tpl"}]
    [{/block}]

    [{assign var="productive_mode" value=$oxcmp_shop->oxshops__oxproductive->value}]

    [{block name="base_style"}]
        [{assign var="colortheme" value=$oViewConf->getViewThemeParam('sColorTheme') }]

        [{if $productive_mode}]
            [{oxstyle include="../build/css/libs.min.css"}]
        [{else}]
            [{oxstyle include="../build/css/libs.css"}]
        [{/if}]

        [{include file=layout/base_colortheme.tpl colortheme=$colortheme productive_mode=$productive_mode}]
    [{/block}]

    [{assign var='rsslinks' value=$oView->getRssLinks() }]
    [{block name="head_link_rss"}]
        [{if $rsslinks}]
            [{foreach from=$rsslinks item='rssentry'}]
                <link rel="alternate" type="application/rss+xml" title="[{$rssentry.title|strip_tags}]" href="[{$rssentry.link}]">
            [{/foreach}]
        [{/if}]
    [{/block}]

    [{block name="head_css"}]
        [{foreach from=$oxidBlock_head item="_block"}]
            [{$_block}]
        [{/foreach}]
    [{/block}]

[{/capture}]

[{assign var="firstload" value=false}]
<!DOCTYPE HTML>
[{assign var="sLanguage" value=$oView->getActiveLangAbbr()}]
<html [{if $sLanguage}]lang="[{$sLanguage}]"[{/if}] [{if $oViewConf->getShowFbConnect() }]xmlns:fb="http://www.facebook.com/2008/fbml"[{/if}]>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">

    [{if $oViewConf->getActiveClassName() != 'clearcookies'}]
        <script>
            document.cookie='resolution='+Math.max(screen.width,screen.height)+("devicePixelRatio" in window ? ","+devicePixelRatio : ",1")+'; path=/';
        </script>
    [{/if}]
    [{foreach from=$oxidBlock_pageHead item="_block"}]
        [{$_block}]
    [{/foreach}]
    [{oxstyle}]
</head>
[{assign var="sResourceUrl" value=$oViewConf->getResourceUrl()}]
[{assign var="sWallpaperFileName" value=$oViewConf->getViewThemeParam('sWallpaper')}]
<body [{if $oView->getClassName() eq 'start'}]class="start-page"[{/if}] [{if $sWallpaperFileName}]data-wallpaper="[{$sResourceUrl}]../img/[{$sWallpaperFileName}]"[{/if}]>
    <nav id="panelmenu" style="display:none">
      [{oxid_include_widget cl="oxwCategoryTree" cnid=$oView->getCategoryId() test="abcd" sWidgetType="header" _parent=$oView->getClassName() nocookie=1 mode="panelmenu"}]
    </nav>

    <div class="mm-page">
        [{foreach from=$oxidBlock_pageBody item="_block"}]
            [{$_block}]
        [{/foreach}]
        [{foreach from=$oxidBlock_pagePopup item="_block"}]
            [{$_block}]
        [{/foreach}]

        [{block name="base_js"}]
            [{if $productive_mode }]
                [{oxscript include="../build/js/libs.min.js" priority=1}]
                [{oxscript include="../build/js/roxid.min.js" priority=10}]
            [{else}]
                [{oxscript include="../build/js/libs.js" priority=1}]
                [{oxscript include="../build/js/roxid.js" priority=2}]
            [{/if}]
        [{/block}]

        [{include file="layout/additional_assets.tpl"}]

        [{if $oViewConf->isModuleActive('oepaypal')}]
            [{oxscript add="$('.paypalExpressCheckoutMsg').zPaypalFix()"}]
        [{/if}]
    </div>

    [{ oxscript }]
    [{include file="widget/js_lang.tpl"}]
    [{ oxid_include_dynamic file="widget/dynscript.tpl" }]

    [{foreach from=$oxidBlock_pageScript item="_block"}]
        [{$_block}]
    [{/foreach}]

    [{if !$productive_mode}]
        [{include file="widget/livereload.tpl"}]
    [{/if}]
</body>
</html>
