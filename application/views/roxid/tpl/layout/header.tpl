[{if $oView->showBetaNote()}]
    [{oxid_include_widget cl="oxwBetaNote" noscript=1 nocookie=1}]
[{/if}]

[{assign var="minibasketDisplay" value=$oViewConf->getViewThemeParam('sMinibasketDisplay')}]

[{if $oViewConf->getTopActionClassName() != 'clearcookies' && $oViewConf->getTopActionClassName() != 'mallstart'}]
    [{oxid_include_widget cl="oxwCookieNote" _parent=$oView->getClassName() nocookie=1}]
[{/if}]

[{foreach from=$icons item=item}]
  [{$item}]
[{/foreach}]

<header id="header">
  <div class="container">

    [{if $oxcmp_user || $oView->getCompareItemCount() || $Errors.loginBoxErrors}]
        [{assign var="blAnon" value=0}]
        [{assign var="force_sid" value=$oView->getSidForWidget()}]
    [{else}]
        [{assign var="blAnon" value=1}]
    [{/if}]

    [{block name="layout_header_top"}]
      <div id="z-headermenu" class="pull-right hidden-xs">
        [{oxid_include_widget cl="oxwLanguageList" lang=$oViewConf->getActLanguageId() _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
        [{oxid_include_widget cl="oxwCurrencyList" cur=$oViewConf->getActCurrency() _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
        [{oxid_include_widget cl="oxwServiceMenu" _parent=$oView->getClassName() force_sid=$force_sid nocookie=$blAnon _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
      </div>
      <div class="clear"></div>
    [{/block}]

    <div class="z-header-row">
      [{assign var="slogoImg" value=$oViewConf->getShopLogo()}]
      [{block name="layout_header_logo"}]
        <div class="z-logo">
          <a id="logo" href="[{$oViewConf->getHomeLink()}]" title="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]"><img src="[{$oViewConf->getImageUrl($slogoImg)}]" alt="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]"></a>
        </div>
      [{/block}]
      [{block name="layout_header_bottom"}]
        [{if $minibasketDisplay=="big"}]
          <div class="z-header-row-right visible-md visible-lg">
              [{if $oxcmp_basket->getProductsCount()}]
                  [{assign var="blAnon" value=0}]
                  [{assign var="force_sid" value=$oView->getSidForWidget()}]
              [{else}]
                  [{assign var="blAnon" value=1}]
              [{/if}]
            [{oxid_include_widget cl="oxwMiniBasket" nocookie=$blAnon force_sid=$force_sid}]
          </div>
        [{/if}]
        <div class="z-header-row-right [{if $minibasketDisplay=="big"}]hidden-md hidden-lg[{/if}]">
          [{include file="widget/header/search.tpl"}]
        </div>
      [{/block}]
      <div class="clear"></div>
    </div>
  </div>
</header>
