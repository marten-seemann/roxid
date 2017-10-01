[{block name="widget_product_listitem_grid"}]
    [{assign var="product"              value=$oView->getProduct()       }]
    [{assign var="blDisableToCart"      value=$oView->getDisableToCart()    }]
    [{assign var="iIndex"               value=$oView->getIndex()           }]
    [{assign var="showMainLink"         value=$oView->getShowMainLink()     }]

    [{if $showMainLink}]
        [{assign var='_productLink' value=$product->getMainLink()}]
    [{else}]
        [{assign var='_productLink' value=$product->getLink()}]
    [{/if}]
    [{assign var="blShowToBasket" value=true}] [{* tobasket or more info ? *}]
    [{if $blDisableToCart || $product->isNotBuyable()||$product->hasMdVariants()||($oViewConf->showSelectListsInList() && $product->getSelections(1))||$product->getVariants()}]
        [{assign var="blShowToBasket" value=false}]
    [{/if}]
    [{capture name=product_price}]
        [{block name="widget_product_listitem_grid_price"}]
            [{oxhasrights ident="SHOWARTICLEPRICE"}]
                [{assign var=tprice value=$product->getTPrice()}]
                [{assign var=price  value=$product->getPrice()}]
                [{block name="widget_product_listitem_grid_price_value"}]
                    <div class="z-productprices">
                        [{if $product->getUnitPrice()}]
                            <div class="z-priceperunit-box">
                                <div id="productPricePerUnit_[{$iIndex}]" class="z-priceperunit">
                                    [{$product->getUnitQuantity()}] [{$product->getUnitName()}]<br>
                                    [{oxprice price=$product->getUnitPrice() currency=$oView->getActCurrency() }]/<span class="z-priceperunit-unit">[{$product->getUnitName()}]</span>
                                </div>
                            </div>
                        [{elseif $product->oxarticles__oxweight->value  }]
                            <div class="z-priceperunit-box">
                                <div id="productPricePerUnit_[{$iIndex}]" class="z-priceperunit">
                                    <span title="weight">[{ oxmultilang ident="WEIGHT" suffix="COLON" }]</span>
                                    <span class="value">[{ $product->oxarticles__oxweight->value }] [{ oxmultilang ident="KG" }]</span>
                                </div>
                            </div>
                        [{/if}]

                        [{if $tprice && $tprice->getBruttoPrice() > $price->getBruttoPrice()}]
                            <div class="z-oldprice">
                                [{ oxmultilang ident="REDUCED_FROM_2" }] <del>[{oxprice price=$product->getTPrice() currency=$oView->getActCurrency()}]</del>
                            </div>
                        [{/if}]
                        [{if $product->getPrice()}]
                            <div class="z-productprice">
                                <strong><span>
                                    [{if $product->isRangePrice()}]
                                        [{ oxmultilang ident="PRICE_FROM" }]
                                        [{if !$product->isParentNotBuyable() }]
                                            [{assign var="oPrice" value=$product->getMinPrice() }]
                                        [{else}]
                                            [{assign var="oPrice" value=$product->getVarMinPrice() }]
                                        [{/if}]
                                    [{else}]
                                        [{if !$product->isParentNotBuyable() }]
                                            [{assign var="oPrice" value=$product->getPrice() }]
                                        [{else}]
                                            [{assign var="oPrice" value=$product->getVarMinPrice() }]
                                        [{/if}]
                                    [{/if}]
                                </span>
                                [{oxprice price=$oPrice currency=$oView->getActCurrency()}][{if $oView->isVatIncluded() }][{if !($product->hasMdVariants() || ($oViewConf->showSelectListsInList() && $product->getSelections(1)) || $product->getVariants())}]<span class="z-vat-included">*</span>[{/if}][{/if}]
                                </strong>
                            </div>
                        [{/if}]
                    </div>
                [{/block}]
            [{/oxhasrights}]
        [{/block}]
    [{/capture}]
    <div class="z-product-title">
        <h4>
            <a href="[{$_productLink}]" title="[{ $product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">[{ $product->oxarticles__oxtitle->value }] [{$product->oxarticles__oxvarselect->value}]</a>
        </h4>
    </div>
    <div class="z-productpicture">
        <a href="[{$_productLink}]" class="titleBlock title fn" title="[{ $product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
            [{if $lazyLoading}]
                <img src="[{ $oViewConf->getImageUrl('grey.gif') }]" data-original="[{$product->getThumbnailUrl()}]" class="img-responsive lazy" alt="[{ $product->oxarticles__oxtitle->value }] [{$product->oxarticles__oxvarselect->value}]">
            [{else}]
                <img src="[{$product->getThumbnailUrl()}]" alt="[{ $product->oxarticles__oxtitle->value }] [{$product->oxarticles__oxvarselect->value}]" class="img-responsive">
            [{/if}]
        </a>
    </div>
    [{block name="widget_product_listitem_grid_tobasket"}]
        <div class="z-priceblock">
            [{oxhasrights ident="TOBASKET"}]
                [{$smarty.capture.product_price}]
                [{*if !$blShowToBasket }]
                    <a href="[{ $_productLink }]" class="toCart button">[{ oxmultilang ident="MORE_INFO" }]</a>
                [{else}]
                    [{assign var="listType" value=$oView->getListType()}]
                    <a href="[{$oView->getLink()|oxaddparams:"listtype=`$listType`&amp;fnc=tobasket&amp;aid=`$product->oxarticles__oxid->value`&amp;am=1" }]" class="toCart button" title="[{oxmultilang ident="WIDGET_PRODUCT_PRODUCT_ADDTOCART" }]">[{$oViewConf->getRoxidIcon('to_basket')}] [{oxmultilang ident="TO_CART" }]</a>
                [{/if*}]
            [{/oxhasrights}]
        </div>
   [{/block}]
[{/block}]

[{oxscript add="$('.z-productlist-grid .z-product-title').dotdotdot();"}]
[{oxscript widget=$oView->getClassName()}]
