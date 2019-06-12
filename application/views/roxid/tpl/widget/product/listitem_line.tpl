    [{block name="widget_product_listitem_line"}]
    [{assign var="product"          value=$oView->getProduct()      }]
    [{assign var="owishid"          value=$oView->getWishId()          }]
    [{assign var="removeFunction"   value=$oView->getRemoveFunction()  }]
    [{assign var="recommid"         value=$oView->getRecommId()        }]
    [{assign var="iIndex"           value=$oView->getIndex()          }]
    [{assign var="showMainLink"     value=$oView->getShowMainLink()    }]
    [{assign var="blDisableToCart"  value=$oView->getDisableToCart()   }]
    [{assign var="toBasketFunction" value=$oView->getToBasketFunction()}]
    [{assign var="altproduct"       value=$oView->getAltProduct()      }]

    [{oxscript add="$('button.removeButton').oxListRemoveButton();"}]

    [{if $showMainLink}]
        [{assign var='_productLink' value=$product->getMainLink()}]
    [{else}]
        [{assign var='_productLink' value=$product->getLink()}]
    [{/if}]
    [{assign var="aVariantSelections" value=$product->getVariantSelections(null,null,1)}]
    [{assign var="blShowToBasket" value=true}] [{* tobasket or more info ? *}]
    [{if $blDisableToCart || $product->isNotBuyable()||($aVariantSelections&&$aVariantSelections.selections)||$product->getVariants()||($oViewConf->showSelectListsInList()&&$product->getSelections(1))}]
        [{assign var="blShowToBasket" value=false}]
    [{/if}]

    <form name="tobasket.[{$iIndex}]" [{if $blShowToBasket}]action="[{ $oViewConf->getSelfActionLink() }]" method="post"[{else}]action="[{$_productLink}]" method="get"[{/if}]  class="js-oxProductForm">
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
                <input id="am_[{$iIndex}]" type="hidden" name="am" value="1">
            [{/oxhasrights}]
        [{else}]
            <input type="hidden" name="cl" value="details">
            <input type="hidden" name="anid" value="[{ $product->oxarticles__oxnid->value }]">
        [{/if}]

        <div class="row">
            [{block name="widget_product_listitem_line_picturebox"}]
                <div class="col-xs-7 col-sm-6">
                    <div class="z-productpicture">
                        <a href="[{ $_productLink }]" title="[{ $product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
                            [{if $lazyLoading}]
                                <img src="[{ $oViewConf->getImageUrl('grey.gif') }]" data-original="[{$product->getThumbnailUrl()}]" alt="[{ $product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]" class="img-responsive">
                            [{else}]
                                <img src="[{$product->getThumbnailUrl()}]" alt="[{ $product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]" class="img-responsive">
                            [{/if}]
                        </a>
                    </div>
                </div>
            [{/block}]

            <div class="col-xs-11 col-sm-10 z-productinfo">
                [{block name="widget_product_listitem_line_selections"}]
                    <div class="z-product-title">
                        <h4>
                            <a href="[{$_productLink}]" class="title" title="[{ $product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
                                <span>[{ $product->oxarticles__oxtitle->value }] [{$product->oxarticles__oxvarselect->value}]</span>
                            </a>
                        </h4>
                        [{*
                        <div class="variants">
                            [{if $aVariantSelections && $aVariantSelections.selections }]
                                <div id="variantselector_[{$iIndex}]" class="selectorsBox js-fnSubmit clear">
                                    [{foreach from=$aVariantSelections.selections item=oSelectionList key=iKey}]
                                        [{include file="widget/product/selectbox.tpl" oSelectionList=$oSelectionList sJsAction="js-fnSubmit"}]
                                    [{/foreach}]
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
                            [{/if}]
                        </div>
                        *}]
                    </div>
                [{/block}]
                [{if $oViewConf->isRatingActive()}]
                    [{block name="widget_product_listitem_line_rating"}]
                        <div class="z-rating hidden-xs">
                            [{oxid_include_widget cl="oxwRating" blCanRate=false _parent=$oViewConf->getTopActiveClassName() nocookie=1 force_sid=$force_sid sRateUrl=false dRatingCount=$product->getArticleRatingCount() dRatingValue=$product->getArticleRatingAverage() anid=$product->oxarticles__oxnid->value skipESIforUser=1}]
                        </div>
                    [{/block}]
                [{/if}]
                [{block name="widget_product_listitem_line_description"}]
                    <div class="z-product-description">
                        [{if $recommid }]
                            <div>[{ $product->text|truncate:180:"..." }]</div>
                        [{else}]
                            [{oxhasrights ident="SHOWSHORTDESCRIPTION"}]
                                [{$product->oxarticles__oxshortdesc->value}]
                            [{/oxhasrights}]
                        [{/if}]
                    </div>
                [{/block}]
            </div>


            <div class="col-xs-6 col-sm-8 z-productline-functions">
                [{block name="widget_product_listitem_line_price"}]
                    [{oxhasrights ident="SHOWARTICLEPRICE"}]
                        [{block name="widget_product_listitem_line_price_value"}]
                            [{*
                            <div class="z-product-amountprice hidden-xs">
                                [{if $product->loadAmountPriceInfo()}]
                                    [{include file="page/details/inc/priceinfo.tpl" oDetailsProduct=$product}]
                                [{/if}]
                            </div>
                            *}]
                            <div class="z-productprices">
                                [{if $product->getTPrice()}]
                                    <div class="z-oldprice">
                                        [{oxmultilang ident="WIDGET_PRODUCT_PRODUCT_REDUCEDFROM"}] <del>[{$product->getFTPrice()}] [{$currency->sign}]</del>
                                    </div>
                                [{/if}]
                                <div class="z-productprice">
                                    <span>
                                        [{if $product->isRangePrice()}]
                                                        [{ oxmultilang ident="PRICE_FROM" }]
                                                        [{if !$product->isParentNotBuyable() }]
                                                            [{ $product->getFMinPrice() }]
                                                        [{else}]
                                                            [{ $product->getFVarMinPrice() }]
                                                        [{/if}]
                                                [{else}]
                                                        [{if !$product->isParentNotBuyable() }]
                                                            [{ $product->getFPrice() }]
                                                        [{else}]
                                                            [{ $product->getFVarMinPrice() }]
                                                        [{/if}]
                                                [{/if}]
                                    </span> [{ $currency->sign}][{if $oView->isVatIncluded() }][{if !($product->hasMdVariants() || ($oViewConf->showSelectListsInList() && $product->getSelections(1)) || $product->getVariants())}]<span class="z-vat-included">*</span>[{/if}][{/if}]
                                </div>
                            </div>
                        [{/block}]

                        [{if $product->getUnitPrice()}]
                            <div id="productPricePerUnit_[{$iIndex}]" class="z-priceperunit">
                                [{$product->getUnitQuantity()}] [{$product->getUnitName()}] | [{oxprice price=$product->getUnitPrice() currency=$oView->getActCurrency() }]/[{$product->getUnitName()}]
                            </div>
                        [{elseif $product->oxarticles__oxweight->value  }]
                            <div id="productPricePerUnit_[{$iIndex}]" class="z-priceperunit">
                                <span title="weight">[{ oxmultilang ident="WEIGHT" suffix="COLON" }]</span>
                                <span class="value">[{ $product->oxarticles__oxweight->value }] [{ oxmultilang ident="KG" }]</span>
                            </div>
                        [{/if}]
                    [{/oxhasrights}]
                [{/block}]
                <div class="z-productlist-buttons hidden-xs">
                    <div class="z-product-compare pull-right">
                        [{if $oViewConf->getShowCompareList()}]
                            [{oxid_include_dynamic file="widget/product/compare_links.tpl" iIndex="_`$iIndex`" type="compare" aid=$product->oxarticles__oxid->value anid=$altproduct in_list=$product->isOnComparisonList() page=$oView->getActPage()}]
                        [{/if}]
                    </div>
                    [{if $removeFunction && (($owishid && ($owishid==$oxcmp_user->oxuser__oxid->value)) || (($wishid==$oxcmp_user->oxuser__oxid->value)) || $recommid) }]
                        <button triggerForm="remove_[{$removeFunction}][{$iIndex}]" type="submit" class="btn btn-sm btn-danger removeButton"><span>[{$oViewConf->getRoxidIcon('remove')}] [{ oxmultilang ident="REMOVE" }]</span></button>
                    [{/if}]
                    [{block name="widget_product_listitem_line_tobasket"}]
                        <div class="z-to-basket pull-right">
                            [{if $blShowToBasket }]
                                [{oxhasrights ident="TOBASKET"}]
                                    <div class="input-group pull-right">
                                        <input id="amountToBasket_[{$iIndex}]" type="number" name="am" value="1" size="3" autocomplete="off" class="form-control input-xxxmini">
                                        <span class="input-group-btn">
                                            <button id="toBasket_[{$iIndex}]" type="submit" class="btn btn-success">[{$oViewConf->getRoxidIcon('to_basket')}] [{oxmultilang ident="TO_CART"}]</button>
                                        </span>
                                    </div>
                                [{/oxhasrights}]
                            [{else}]
                                <a class="btn btn-primary" href="[{ $_productLink }]" >[{ oxmultilang ident="MORE_INFO" }]</a>
                            [{/if}]
                        </div>
                    [{/block}]
                </div>
            </div>
        </div>
    </form>

    [{if $removeFunction && (($owishid && ($owishid==$oxcmp_user->oxuser__oxid->value)) || (($wishid==$oxcmp_user->oxuser__oxid->value)) || $recommid) }]
        <form action="[{ $oViewConf->getSelfActionLink() }]" method="post" id="remove_[{$removeFunction}][{$iIndex}]">
            <div>
                [{ $oViewConf->getHiddenSid() }]
                <input type="hidden" name="cl" value="[{ $oViewConf->getTopActiveClassName() }]">
                <input type="hidden" name="fnc" value="[{$removeFunction}]">
                <input type="hidden" name="aid" value="[{$product->oxarticles__oxid->value}]">
                <input type="hidden" name="am" value="0">
                <input type="hidden" name="itmid" value="[{$product->getItemKey()}]">
                [{if $recommid}]
                    <input type="hidden" name="recommid" value="[{$recommid}]">
                [{/if}]
            </div>
        </form>
    [{/if}]
[{/block}]

[{oxscript widget=$oView->getClassName()}]
[{oxscript add="$('.z-productlist-line .z-product-title').dotdotdot();"}]
