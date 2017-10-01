[{assign var="_oBoxProduct" value=$oView->getProduct()}]
[{assign var="_sTitle" value="`$_oBoxProduct->oxarticles__oxtitle->value` `$_oBoxProduct->oxarticles__oxvarselect->value`"|strip_tags}]
[{block name="widget_product_boxproduct_image"}]
    <li class="articleImage z-featured-article-image" [{if !$smarty.foreach._sProdList.first}] style="display:none;" [{/if}]>
        <a class="articleBoxImage" href="[{ $_oBoxProduct->getMainLink() }]">
            <img src="[{ $oViewConf->getImageUrl('grey.gif') }]" data-original="[{$_oBoxProduct->getIconUrl()}]" class="lazy" alt="[{$_sTitle}]">
        </a>
    </li>
[{/block}]

[{block name="widget_product_boxproduct"}]
    <li class="z-featured-article-title articleTitle">
        <a href="[{ $_oBoxProduct->getMainLink() }]">
            <div class="z-product-title">[{ $_sTitle }]</div>
            [{oxhasrights ident="SHOWARTICLEPRICE"}]
                [{if $_oBoxProduct->getPrice()}]
                    [{block name="widget_product_boxproduct_price"}]
                        <div class="z-productprice">
                            <strong> [{if $_oBoxProduct->isRangePrice()}]
                                [{ oxmultilang ident="PRICE_FROM" }]
                                [{if !$_oBoxProduct->isParentNotBuyable() }]
                                    [{assign var="oPrice" value=$_oBoxProduct->getMinPrice() }]
                                [{else}]
                                    [{assign var="oPrice" value=$_oBoxProduct->getVarMinPrice() }]
                                [{/if}]
                                [{else}]
                                [{if !$_oBoxProduct->isParentNotBuyable() }]
                                    [{assign var="oPrice" value=$_oBoxProduct->getPrice() }]
                                [{else}]
                                    [{assign var="oPrice" value=$_oBoxProduct->getVarMinPrice() }]
                                [{/if}]
                                [{/if}]
                                [{oxprice price=$oPrice currency=$oView->getActCurrency()}][{if $oView->isVatIncluded() }][{if !( $_oBoxProduct->getVariantsCount() || $_oBoxProduct->hasMdVariants() || ($oViewConf->showSelectListsInList()&&$_oBoxProduct->getSelections(1)) )}]<span class="z-vat-included">*</span>[{/if}][{/if}]
                            </strong>
                        </div>
                    [{/block}]
                [{/if}]
            [{/oxhasrights}]
        </a>
    </li>
[{/block}]

[{oxscript widget=$oView->getClassName()}]
