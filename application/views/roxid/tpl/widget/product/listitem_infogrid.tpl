[{block name="widget_product_listitem_infogrid"}]
    [{assign var="product"              value=$oView->getProduct()      }]
    [{assign var="owishid"              value=$oView->getWishId()          }]
    [{assign var="toBasketFunction"     value=$oView->getToBasketFunction()}]
    [{assign var="recommid"             value=$oView->getRecommId()        }]
    [{assign var="showMainLink"         value=$oView->getShowMainLink()    }]
    [{assign var="blDisableToCart"      value=$oView->getDisableToCart()   }]
    [{assign var="iIndex"               value=$oView->getIndex()          }]
    [{assign var="altproduct"           value=$oView->getAltProduct()      }]

    [{if $showMainLink}]
        [{assign var='_productLink' value=$product->getMainLink()}]
    [{else}]
        [{assign var='_productLink' value=$product->getLink()}]
    [{/if}]
    [{assign var="aVariantSelections" value=$product->getVariantSelections(null,null,1)}]
    [{assign var="blShowToBasket" value=true}] [{* tobasket or more info ? *}]
    [{if $blDisableToCart || $product->isNotBuyable()||($aVariantSelections&&$aVariantSelections.selections)||$product->hasMdVariants()||($oViewConf->showSelectListsInList() && $product->getSelections(1))||$product->getVariants()}]
        [{assign var="blShowToBasket" value=false}]
    [{/if}]

    <form name="tobasket[{$iIndex}]" [{if $blShowToBasket}]action="[{ $oViewConf->getSelfActionLink() }]" method="post"[{else}]action="[{$_productLink}]" method="get"[{/if}]>
        [{ $oViewConf->getNavFormParams() }]
        [{ $oViewConf->getHiddenSid() }]
        <input type="hidden" name="pgNr" value="[{ $oView->getActPage() }]">
        [{if $recommid}]
            <input type="hidden" name="recommid" value="[{ $recommid }]">
        [{/if}]
        [{if $blShowToBasket}]
            [{oxhasrights ident="TOBASKET"}]
                <input type="hidden" name="cl" value="[{ $oViewConf->getTopActiveClassName() }]">
                [{if $owishid}]
                    <input type="hidden" name="owishid" value="[{$owishid}]">
                [{/if}]
                [{if $toBasketFunction}]
                    <input type="hidden" name="fnc" value="[{$toBasketFunction}]">
                [{else}]
                  <input type="hidden" name="fnc" value="tobasket">
                [{/if}]
                <input type="hidden" name="aid" value="[{ $product->oxarticles__oxid->value }]">
                [{if $altproduct}]
                    <input type="hidden" name="anid" value="[{ $altproduct }]">
                [{else}]
                    <input type="hidden" name="anid" value="[{ $product->oxarticles__oxnid->value }]">
                [{/if}]
                <input type="hidden" name="am" value="1">
            [{/oxhasrights}]
        [{else}]
            <input type="hidden" name="cl" value="details">
            <input type="hidden" name="anid" value="[{ $product->oxarticles__oxnid->value }]">
        [{/if}]

        <div class="z-productlist-infogrid-content">
            [{block name="widget_product_listitem_infogrid_gridpicture"}]
                <div class="z-productpicture">
                    <a href="[{$_productLink}]" title="[{ $product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
                        [{if $lazyLoading}]
                            <img src="[{ $oViewConf->getImageUrl('grey.gif') }]" data-original="[{$product->getThumbnailUrl()}]" alt="[{ $product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]" class="img-responsive">
                        [{else}]
                            <img src="[{$product->getThumbnailUrl()}]" alt="[{ $product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]" class="img-responsive">
                        [{/if}]
                    </a>
                </div>
            [{/block}]

            <div class="z-productdetails">
                [{block name="widget_product_listitem_infogrid_titlebox"}]
                    <div class="z-product-title">
                        <h4>
                            <a href="[{$_productLink}]" class="title" title="[{ $product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
                                <span>[{ $product->oxarticles__oxtitle->value }] [{$product->oxarticles__oxvarselect->value}]</span>
                            </a>
                        </h4>
                    </div>
                [{/block}]

                [{*block name="widget_product_listitem_infogrid_selections"}]
                    <div class="selectorsBox">
                        [{ if $aVariantSelections && $aVariantSelections.selections }]
                            <div id="variantselector_[{$iIndex}]" class="selectorsBox js-fnSubmit clear">
                                <table class="dropdown-table"><tbody>
                                    [{foreach from=$aVariantSelections.selections item=oSelectionList key=iKey}]
                                        [{include file="widget/product/selectbox.tpl" oSelectionList=$oSelectionList sJsAction="js-fnSubmit"}]
                                    [{/foreach}]
                                </tbody></table>
                            </div>
                        [{elseif $oViewConf->showSelectListsInList()}]
                            [{assign var="oSelections" value=$product->getSelections(1)}]
                            [{if $oSelections}]
                                <div id="selectlistsselector_[{$iIndex}]" class="selectorsBox js-fnSubmit clear">
                                    [{foreach from=$oSelections item=oList name=selections}]
                                        [{include file="widget/product/selectbox.tpl" oSelectionList=$oList sFieldName="sel" iKey=$smarty.foreach.selections.index blHideDefault=true sSelType="seldrop" sJsAction="js-fnSubmit"}]
                                    [{/foreach}]
                                </div>
                            [{/if}]
                        [{/if }]
                    </div>
                [{/block*}]

                [{block name="widget_product_listitem_infogrid_price"}]
                    [{oxhasrights ident="SHOWARTICLEPRICE"}]
                        [{assign var=tprice value=$product->getTPrice()}]
                        [{assign var=price  value=$product->getPrice()}]

                        [{block name="widget_product_listitem_infogrid_price_value"}]
                            [{if $product->getFPrice()}]
                                <div class="z-productprices">
                                    [{ if $product->getUnitPrice()}]
                                        <div id="productPricePerUnit_[{$iIndex}]" class="z-priceperunit">
                                            [{$product->getUnitQuantity()}] [{$product->getUnitName()}] | [{oxprice price=$product->getUnitPrice() currency=$oView->getActCurrency() }]/[{$product->getUnitName()}]
                                        </div>
                                    [{elseif $product->oxarticles__oxweight->value  }]
                                        <div id="productPricePerUnit_[{$iIndex}]" class="z-priceperunit">
                                            <span id="productPricePerUnit_[{$iIndex}]" class="pricePerUnit">
                                            <span title="weight">[{ oxmultilang ident="WEIGHT" suffix="COLON" }]</span>
                                            <span class="value">[{ $product->oxarticles__oxweight->value }] [{ oxmultilang ident="KG" }]</span>
                                        </div>
                                    [{/if }]
                                    [{if $tprice && $tprice->getBruttoPrice() > $price->getBruttoPrice()}]
                                        <div class="z-oldprice">[{ oxmultilang ident="WIDGET_PRODUCT_PRODUCT_REDUCEDFROM" }] <del>[{ $product->getFTPrice()}] [{ $currency->sign}]</del></div>
                                    [{/if}]
                                    <div class="z-productprice">
                                        <span>
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
                                    </div>
                                </div>
                            [{/if}]
                        [{/block}]
                    [{/oxhasrights}]
                [{/block}]

                [{block name="widget_product_listitem_infogrid_tobasket"}]
                    <div class="z-productlist-buttons hidden-xs">
                        [{if $oViewConf->getShowCompareList()}]
                            <div class="z-product-compare hidden-xs">
                                [{oxid_include_dynamic file="widget/product/compare_links.tpl" iIndex="_`$iIndex`" type="compare" aid=$product->oxarticles__oxid->value anid=$altproduct in_list=$product->isOnComparisonList() page=$oView->getActPage()}]
                            </div>
                        [{/if}]
                        <div class="z-to-basket">
                            [{if $blShowToBasket }]
                                [{oxhasrights ident="TOBASKET"}]
                                    <button type="submit" class="btn btn-sm btn-success pull-right">[{$oViewConf->getRoxidIcon('to_basket')}] [{oxmultilang ident="TO_CART"}]</button>
                                [{/oxhasrights}]
                            [{else}]
                                <a class="btn btn-sm btn-primary" href="[{ $_productLink }]" >[{ oxmultilang ident="MORE_INFO" }]</a>
                            [{/if}]
                        </div>
                    </div>
                [{/block}]
            </div>
        </div>
    </form>
[{/block}]

[{oxscript add="$('.z-productlist-infogrid .z-product-title').dotdotdot();"}]
