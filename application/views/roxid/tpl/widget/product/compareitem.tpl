[{assign var="product" value=$oView->getProduct()}]
[{assign var="recommid" value=$oView->getRecommId()}]
[{assign var="iIndex" value=$oView->getIndex()}]
[{assign var="altproduct" value=$oView->getAltProduct()}]

<div class="z-compare-item-content">
    [{assign var='_productLink' value=$product->getLink()}]

    <div class="z-product-picture">
        <a href="[{ $_productLink }]" class="picture" [{if $oView->noIndex() }]rel="nofollow"[{/if}]>
          <img src="[{ $product->getThumbnailUrl() }]" alt="[{ $product->oxarticles__oxtitle->value|strip_tags }] [{ $product->oxarticles__oxvarselect->value|default:'' }]">
        </a>
    </div>

    <div class="z-product-title">
        <a class="fn" href="[{ $_productLink }]" [{if $oView->noIndex() }]rel="nofollow"[{/if}]>[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]</a>
    </div>

    [{assign var="aVariantSelections" value=$product->getVariantSelections(null,null,1)}]
    [{assign var="blShowToBasket" value=true}] [{* tobasket or more info ? *}]
    [{if $product->isNotBuyable()||($aVariantSelections&&$aVariantSelections.selections)||$product->hasMdVariants()||($oViewConf->showSelectListsInList() && $product->getSelections(1))||$product->getVariants()}]
        [{assign var="blShowToBasket" value=false}]
    [{/if}]

    <form name="tobasket.[{$iIndex}]" [{if $blShowToBasket}]action="[{ $oViewConf->getSelfActionLink() }]" method="post"[{else}]action="[{$_productLink}]" method="get"[{/if}] class="z-compare-actions">
        <div class="z-variants">
            [{oxhasrights ident="TOBASKET"}]
                [{if $blShowToBasket}]
                    [{ $oViewConf->getHiddenSid() }]
                    [{ $oViewConf->getNavFormParams() }]
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
                    [{if $recommid}]
                        <input type="hidden" name="recommid" value="[{ $recommid }]">
                    [{/if}]
                    <input type="hidden" name="pgNr" value="[{ $oView->getActPage() }]">
                [{/if}]
            [{/oxhasrights}]

            [{if $aVariantSelections && $aVariantSelections.selections }]
                <div id="compareVariantSelections_[{$iIndex}]">
                    <table class="dropdown-table"><tbody>
                        [{foreach from=$aVariantSelections.selections item=oSelectionList key=iKey}]
                            [{include file="widget/product/selectbox.tpl" oSelectionList=$oSelectionList}]
                        [{/foreach}]
                    </tbody></table>
                </div>
            [{elseif $oViewConf->showSelectListsInList()}]
                [{assign var="oSelections" value=$product->getSelections(1)}]
                [{if $oSelections}]
                    <div id="compareSelections_[{$iIndex}]">
                        [{foreach from=$oSelections item=oList name=selections}]
                            [{include file="widget/product/selectbox.tpl" oSelectionList=$oList sFieldName="sel" iKey=$smarty.foreach.selections.index blHideDefault=true sSelType="seldrop"}]
                        [{/foreach}]
                    </div>
                [{/if}]
            [{/if}]
        </div>

        <div>
            <div class="z-productprices">
                [{oxhasrights ident="SHOWARTICLEPRICE"}]
                    [{assign var="sFrom" value=""}]
                    [{assign var="oPrice" value=$product->getPrice()}]
                    [{if $product->isParentNotBuyable() }]
                        [{assign var="oPrice" value=$product->getVarMinPrice()}]
                        [{if $product->isRangePrice() }]
                            [{assign var="sFrom" value="PRICE_FROM"|oxmultilangassign}]
                        [{/if}]
                    [{/if}]

                    <div class="z-priceperunit">
                        [{if $product->getUnitPrice()}]
                            <span>[{$product->getUnitQuantity()}] [{$product->getUnitName()}] | [{oxprice price=$product->getUnitPrice() currency=$oView->getActCurrency() }]/[{$product->getUnitName()}]</span>
                        [{/if}]
                    </div>
                    [{if $product->getTPrice()}]
                        <div class="z-oldprice">
                            <strong>[{oxmultilang ident="REDUCED_FROM_2"}] <del>[{oxprice price=$product->getTPrice() currency=$oView->getActCurrency()}]</del></strong>
                        </div>
                     [{/if}]
                [{/oxhasrights}]

                [{oxhasrights ident="SHOWARTICLEPRICE"}]
                    [{if $product->loadAmountPriceInfo()}]
                        <div class="z-product-amountprice">
                            [{include file="page/details/inc/priceinfo.tpl" oDetailsProduct=$product amountpricePopoverPlacement="top"}]
                        </div>
                    [{/if}]
                    <div id="productPrice_[{$iIndex}]" class="z-product-price">
                        <strong>[{$sFrom}] [{oxprice price=$oPrice currency=$oView->getActCurrency()}][{if $blShowToBasket }]<span class="z-vat-included">*</span>[{/if}]</strong>
                    </div>
                [{/oxhasrights}]
            </div>

            [{if $blShowToBasket }]
                [{oxhasrights ident="TOBASKET"}]
                    <div class="z-to-basket">
                        <div class="input-group">
                            <input type="text" name="am" value="1" size="3" autocomplete="off" class="form-control input-xxxmini" title="[{ oxmultilang ident="QUANTITY" suffix="COLON"}]">
                            <span class="input-group-btn">
                                <button type="submit" class="btn btn-success">[{$oViewConf->getRoxidIcon('to_basket')}] [{oxmultilang ident="TO_CART"}]</button>
                            </span>
                        </div>
                    </div>
                [{/oxhasrights}]
            [{/if}]

            [{if !$blShowToBasket}]
                <div class="z-variants-moreinfo">
                    <a id="variantMoreInfo_[{$iIndex}]" class="btn btn-default" href="[{ $_productLink }]" onclick="oxid.mdVariants.getMdVariantUrl('mdVariant_[{$iIndex}]'); return false;">[{ oxmultilang ident="MORE_INFO" }]</a>
                </div>
            [{/if}]

            [{* additional info *}]
            <div class="z-product-additional-info">
                    <div class="z-stock-status">
                        [{if $product->getStockStatus() == -1}]
                            <span class="z-stock-flag z-stock-not">
                                [{$oViewConf->getRoxidIcon('stockflag')}]
                                [{if $product->oxarticles__oxnostocktext->value}]
                                    [{$product->oxarticles__oxnostocktext->value}]
                                [{elseif $oViewConf->getStockOffDefaultMessage()}]
                                    [{oxmultilang ident="MESSAGE_NOT_ON_STOCK"}]
                                [{/if}]
                                [{*if $product->getDeliveryDate()}]
                                    [{oxmultilang ident="AVAILABLE_ON"}] [{$product->getDeliveryDate()}]
                                [{/if*}]
                            </span>
                        [{elseif $product->getStockStatus() == 1}]
                            <span class="z-stock-flag z-stock-low">
                                [{$oViewConf->getRoxidIcon('stockflag')}]
                                [{oxmultilang ident="LOW_STOCK"}]
                            </span>
                        [{elseif $product->getStockStatus() == 0}]
                            <span class="z-stock-flag">
                                [{$oViewConf->getRoxidIcon('stockflag')}]
                                [{if $product->oxarticles__oxstocktext->value}]
                                    [{$product->oxarticles__oxstocktext->value}]
                                [{elseif $oViewConf->getStockOnDefaultMessage()}]
                                    [{oxmultilang ident="READY_FOR_SHIPPING"}]
                                [{/if}]
                            </span>
                        [{/if}]
                    </div>
            </div>

        </div>

    </form>
</div>

[{oxscript widget=$oView->getClassName()}]
