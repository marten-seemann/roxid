[{assign var="aVariantSelections" value=$oView->getVariantSelections()}]
[{assign var="productive_mode" value=$oxcmp_shop->oxshops__oxproductive->value}]

[{if $productive_mode}]
    [{oxscript include="../build/js/libs_productpage.min.js" priority=10}]
[{else}]
    [{oxscript include="../build/js/libs_productpage.js" priority=10}]
[{/if}]

[{if $aVariantSelections && $aVariantSelections.rawselections}]
    [{assign var="_sSelectionHashCollection" value=""}]
    [{foreach from=$aVariantSelections.rawselections item=oSelectionList key=iKey}]
        [{assign var="_sSelectionHash" value=""}]
        [{foreach from=$oSelectionList item=oListItem key=iPos}]
            [{assign var="_sSelectionHash" value=$_sSelectionHash|cat:$iPos|cat:":"|cat:$oListItem.hash|cat:"|"}]
        [{/foreach}]
        [{if $_sSelectionHash}]
            [{if $_sSelectionHashCollection}][{assign var="_sSelectionHashCollection" value=$_sSelectionHashCollection|cat:","}][{/if}]
            [{assign var="_sSelectionHashCollection" value=$_sSelectionHashCollection|cat:"'`$_sSelectionHash`'"}]
        [{/if}]
    [{/foreach}]
    [{oxscript add="oxVariantSelections  = [`$_sSelectionHashCollection`];"}]

    <form class="js-oxWidgetReload" action="[{$oView->getWidgetLink()}]" method="get">
        <div>
            [{$oViewConf->getHiddenSid()}]
            [{$oViewConf->getNavFormParams()}]
            <input type="hidden" name="cl" value="[{$oView->getClassName()}]">
            <input type="hidden" name="oxwparent" value="[{$oViewConf->getTopActiveClassName()}]">
            <input type="hidden" name="listtype" value="[{$oView->getListType()}]">
            <input type="hidden" name="nocookie" value="1">
            <input type="hidden" name="cnid" value="[{$oView->getCategoryId()}]">
            <input type="hidden" name="anid" value="[{if !$oDetailsProduct->oxarticles__oxparentid->value}][{$oDetailsProduct->oxarticles__oxid->value}][{else}][{$oDetailsProduct->oxarticles__oxparentid->value}][{/if}]">
            <input type="hidden" name="actcontrol" value="[{$oViewConf->getTopActiveClassName()}]">
        </div>
    </form>
[{/if}]

[{* for some strange reason this has to be placed here in order to work in mobile Safari *}]
[{oxscript add="$( '#variants' ).oxArticleVariant();"}]


[{oxhasrights ident="TOBASKET"}]
    <form class="form-horizontal js-oxProductForm" action="[{$oViewConf->getSelfActionLink()}]" method="post" data-toggle="roxid-validator">
        <div>
            [{$oViewConf->getHiddenSid()}]
            [{$oViewConf->getNavFormParams()}]
            <input type="hidden" name="cl" value="[{$oViewConf->getTopActiveClassName()}]">
            <input type="hidden" name="aid" value="[{$oDetailsProduct->oxarticles__oxid->value}]">
            <input type="hidden" name="anid" value="[{$oDetailsProduct->oxarticles__oxnid->value}]">
            <input type="hidden" name="parentid" value="[{if !$oDetailsProduct->oxarticles__oxparentid->value}][{$oDetailsProduct->oxarticles__oxid->value}][{else}][{$oDetailsProduct->oxarticles__oxparentid->value}][{/if}]">
            <input type="hidden" name="panid" value="">
            [{if !$oDetailsProduct->isNotBuyable()}]
                <input type="hidden" name="fnc" value="tobasket">
            [{/if}]
        </div>
[{/oxhasrights}]


<div class="visible-xs">
    [{block name="details_productmain_title"}]
        [{include file="page/details/inc/title.tpl"}]
    [{/block}]
    [{if $oView->ratingIsActive()}]
        [{block name="details_productmain_ratings"}]
            [{include file="page/details/inc/ratings.tpl"}]
        [{/block}]
        <div class="clear"></div>
    [{/if}]
</div>

[{assign var="showReviewTab" value=$oViewConf->getViewThemeParam('blShowReviewTab')}]
[{capture name="review_scroller" assign="review_scroller"}]
    function goToReviewTab () {
        var tab = $('.z-product-info-tabs a[href="#review"]');
        tab.tab('show');
        $('html, body').animate({
            scrollTop: tab.offset().top-150
        }, 200);
    }

    [{if $showReviewTab && $smarty.post.fnc == "savereview"}]
        goToReviewTab();
    [{/if}]

    $(".z-information a[href^='#review']").click(function() {
        [{if $showReviewTab}]
            goToReviewTab();
            return false;
        [{else}]
            $('html, body').animate({
                scrollTop: $("#review").offset().top-200
            }, 200);
            return false;
        [{/if}]
    });
[{/capture}]
[{oxscript add=$review_scroller}]

<div class="row">
    <div class="col-sm-13 col-md-13 col-lg-14">
        <div class="z-product-picture-wrapper">
            [{* article picture with zoom *}]

            [{block name="details_productmain_zoom"}]
                <div class="z-product-picture">
                    [{if $oView->showZoomPics()}]
                        <div class="z-product-picture-magnifier visible-lg">[{$oViewConf->getRoxidIcon('product_picture_magnifier')}]</div>
                        <div class="z-product-picture">
                            <img id="product-picture" src="[{$oView->getActPicture()}]" class="img-responsive" data-zoom-image="[{$oPictureProduct->getMasterZoomPictureUrl(1)}]" alt="">
                        </div>
                    [{/if}]
                </div>
                <div class="clear"></div>
                <div id="z-productpicture-more">
                    [{block name="details_productmain_morepics"}]
                        [{include file="page/details/inc/morepics.tpl"}]
                    [{/block}]
                </div>

            [{/block}]
        </div>
    </div>


    [{* article main info block *}]
    <div class="col-sm-11 col-md-11 col-lg-10">
        <div class="z-information">
            [{ assign var="oManufacturer" value=$oView->getManufacturer()}]
            <div class="z-detailsbox">
                <div class="hidden-xs">
                    [{block name="details_productmain_title"}]
                        [{include file="page/details/inc/title.tpl"}]
                    [{/block}]
                </div>

                [{if $oView->ratingIsActive()}]
                    <div class="row hidden-xs">
                        <div class="col-sm-24">
                            [{block name="details_productmain_ratings"}]
                                [{include file="page/details/inc/ratings.tpl"}]
                            [{/block}]
                        </div>
                    </div>
                [{/if}]

                <div class="row">
                    [{assign var="showManufacturer" value=false}]
                    [{if $oViewConf->getViewThemeParam("blShowManufacturerOnProductPage") && $oManufacturer->oxmanufacturers__oxicon->value}]
                        [{assign var="showManufacturer" value=true}]
                    [{/if}]

                    [{block name="details_productmain_manufacturersicon"}]
                        [{include file="page/details/inc/manufacturersicon.tpl"}]
                    [{/block}]

                    <div class="col-xs-[{if $showManufacturer}]18 z-col-next-to-manufacturer-logo[{else}]24[{/if}]">
                        [{* article number *}]
                        [{block name="details_productmain_artnumber"}]
                            [{include file="page/details/inc/artnumber.tpl"}]
                        [{/block}]

                        <div class="z-product-shortinfo">
                            [{block name="details_productmain_shortdesc"}]
                                [{include file="page/details/inc/shortdesc.tpl"}]
                            [{/block}]
                        </div>
                    </div>
                </div>
            </div>

            <div class="z-detailsbox hidden-xs">
                [{block name="details_productmain_productlinksselector"}]
                    <div class="z-actionlinks clear">
                        [{block name="details_productmain_productlinks"}]
                            [{include file="widget/product/productlinks.tpl"}]
                        [{/block}]
                    </div>
                    <div class="clear"></div>
                [{/block}]
                [{block name="details_productmain_social"}]
                    [{include file="page/details/inc/social.tpl"}]
                [{/block}]
                <div class="clear"></div>
            </div>

            [{assign var="blCanBuy" value=true}]
            [{* variants | md variants *}]

            [{if $oViewConf->showSelectLists()}]
                [{assign var="oSelections" value=$oDetailsProduct->getSelections()}]
            [{/if}]
            [{if (($aVariantSelections && $aVariantSelections.selections) || $oView->isPersParam() || ($oViewConf->showSelectLists() && $oSelections)) }]
                <div class="z-detailsbox">
                    [{block name="details_productmain_variantselections"}]
                        [{assign var="blCanBuy" value=$aVariantSelections.blPerfectFit}]
                        [{include file="page/details/inc/variantselections.tpl"}]
                        [{if !$blHasActiveSelections && !$blCanBuy && !$oDetailsProduct->isParentNotBuyable()}]
                            [{assign var="blCanBuy" value=true}]
                        [{/if}]
                    [{/block}]

                    [{* selection lists *}]
                    [{block name="details_productmain_selectlists"}]
                        [{include file="page/details/inc/selectlists.tpl"}]
                    [{/block}]

                    [{* pers params *}]
                    [{block name="details_productmain_persparams"}]
                        [{include file="page/details/inc/persparams.tpl"}]
                    [{/block}]
                </div>
            [{/if}]


            <div class="z-detailsbox z-detailsbox-to-basket">
                <div class="row">
                    <div class="z-product-additional-info col-xs-24">
                        [{block name="details_productmain_stockstatus"}]
                            [{include file="page/details/inc/stockstatus.tpl"}]
                        [{/block}]
                        [{block name="details_productmain_deliverytime"}]
                            [{include file="page/details/inc/deliverytime.tpl"}]
                        [{/block}]
                    </div>
                </div>

                [{if $oDetailsProduct->oxarticles__oxweight->value || $oDetailsProduct->getUnitPrice() || ($oDetailsProduct->getFPrice() && $oDetailsProduct->loadAmountPriceInfo()) }]
                    <div class="row">

                    </div>
                [{/if}]

                <div class="row">
                    [{* additional info *}]
                    <div class="z-product-additional-info col-xs-12">
                        [{block name="details_productmain_weight"}]
                            [{include file="page/details/inc/weight.tpl"}]
                        [{/block}]

                        [{block name="details_productmain_priceperunit"}]
                            [{include file="page/details/inc/priceperunit.tpl"}]
                        [{/block}]
                    </div>
                    [{oxhasrights ident="SHOWARTICLEPRICE"}]
                        <div class="z-productprices col-xs-12">
                            [{if $oDetailsProduct->getPrice()}]
                                <div class="z-productprices-wrapper">
                                    [{block name="details_productmain_tprice"}]
                                        [{include file="page/details/inc/tprice.tpl"}]
                                    [{/block}]

                                    [{block name="details_productmain_watchlist"}][{/block}]

                                    [{block name="details_productmain_price"}]
                                        [{include file="page/details/inc/price.tpl"}]
                                    [{/block}]
                                </div>
                            [{/if}]
                            [{if $oDetailsProduct->loadAmountPriceInfo()}]
                                <div class="z-product-amountprice">
                                    [{block name="details_productmain_amountprice"}]
                                        [{include file="page/details/inc/amountprice.tpl"}]
                                    [{/block}]
                                </div>
                            [{/if}]
                        </div>
                    [{/oxhasrights}]
                </div>
                <div class="row">
                    <div class="z-to-basket col-xs-24">
                        [{block name="details_productmain_tobasket"}]
                            [{include file="page/details/inc/tobasket.tpl"}]
                        [{/block}]
                    </div>
                </div>

                <div class="clear"></div>
            </div>
        </div>
    </div>
</div>

[{oxhasrights ident="TOBASKET"}]
    </form>
[{/oxhasrights}]

[{include file="page/details/inc/pictureviewer.tpl"}]
[{include file="widget/tobasketajax.tpl"}]
[{oxscript widget=$oView->getClassName()}]
