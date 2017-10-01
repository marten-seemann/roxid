[{assign var="currency" value=$oView->getActCurrency() }]
[{assign var="device" value=$oViewConf->detectDevice()}]

[{if !$type}]
    [{assign var="type" value="infogrid"}]
[{/if}]

[{if $isStartPage}]
    [{assign var="typePhone" value=$oViewConf->getViewThemeParam('sStartPageListDisplayTypePhone')}]
[{else}]
    [{assign var="typePhone" value=$oViewConf->getViewThemeParam('sDefaultListDisplayTypePhone')}]
[{/if}]

[{if $device == "phone" }]
    [{assign var="type" value=$typePhone}]
[{/if}]

[{* on first page load, detectDevice() does not work, since the cookie is not yet set, and returns "unknown". In those cases, if the list type for phones differs from the requested one, show both with hidden-xs and visible-xs classes*}]
[{assign var="showPhoneFallback" value=false}]
[{if $device == "unknown" && $type != $typePhone }]
    [{assign var="showPhoneFallback" value=true}]
[{/if}]



[{oxscript add="$('a.js-external').attr('target', '_blank');"}]
[{if $head}]
    [{if $header eq "light"}]
        <h3>[{$head}]</h3>
    [{else}]
        <h2>
            <span>[{$head}]</span>
            [{if $rsslink}]
                <a class="rss js-external" id="[{$rssId}]" href="[{$rsslink.link}]" title="[{$rsslink.title}]">[{$oViewConf->getRoxidIcon('rss')}]</a>
            [{/if}]
        </h2>
    [{/if}]
[{/if}]


[{if $products|@count gt 0}]
    <ul class="z-productlist z-productlist-[{$type}] list-unstyled [{if $showPhoneFallback }]hidden-xs[{/if}]" [{if $listId}]id="[{$listId}]"[{/if}]>
        [{foreach from=$products item=_product name=productlist}]
            [{assign var="_sTestId" value=$listId|cat:"_"|cat:$smarty.foreach.productlist.iteration}]
            <li class="z-productlist-item z-productlist-[{$type}]-item">
                <div>
                    [{oxid_include_widget cl="oxwArticleBox" _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() iLinkType=$_product->getLinkType() _object=$_product anid=$_product->getId() sWidgetType=product sListType=listitem_$type iIndex=$_sTestId blDisableToCart=$blDisableToCart isVatIncluded=$oView->isVatIncluded() showMainLink=$showMainLink recommid=$recommid owishid=$owishid toBasketFunction=$toBasketFunction removeFunction=$removeFunction altproduct=$altproduct inlist=$_product->isInList() skipESIforUser=1 lazyLoading=$lazyLoading}]
                </div>
            </li>
        [{/foreach}]
    </ul>
    <div class="clear"></div>

    [{if $device == "unknown" && $showPhoneFallback}]
        [{assign var="type" value=$typePhone}]
        <ul class="z-productlist z-productlist-[{$type}] list-unstyled visible-xs" [{if $listId}]id="[{$listId}]_phoneFallback"[{/if}]>
            [{foreach from=$products item=_product name=productlist}]
                [{assign var="_sTestId" value=$listId|cat:"_"|cat:$smarty.foreach.productlist.iteration}]
                <li class="z-productlist-item z-productlist-[{$type}]-item">
                    <div>
                        [{oxid_include_widget cl="oxwArticleBox" _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() iLinkType=$_product->getLinkType() _object=$_product anid=$_product->getId() sWidgetType=product sListType=listitem_$type iIndex=$_sTestId blDisableToCart=$blDisableToCart isVatIncluded=$oView->isVatIncluded() showMainLink=$showMainLink recommid=$recommid owishid=$owishid toBasketFunction=$toBasketFunction removeFunction=$removeFunction altproduct=$altproduct inlist=$_product->isInList() skipESIforUser=1 lazyLoading=$lazyLoading}]
                    </div>
                </li>
            [{/foreach}]
        </ul>
        <div class="clear"></div>
    [{/if}]

    [{oxscript add="$('.z-productlist-line .z-product-description').dotdotdot()"}]
[{/if}]
