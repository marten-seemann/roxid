[{assign var="_additionalParams" value=$oView->getAdditionalParams()}]

<div id="productMain">
    <div id="detailsMain">
        [{include file="page/details/inc/productmain.tpl"}]
    </div>
</div>
<div id="productInfo" class="z-product-info"> [{* class="detailsRelated clear">*}]
    [{assign var="device" value=$oViewConf->detectDevice()}]

    [{capture name="product_sidebar" assign="product_sidebar"}]
        [{if $device != "phone"}]
            [{ include file="page/details/inc/related_products.tpl" }]
        [{/if}]
    [{/capture}]


    [{if $product_sidebar|trim|count_characters > 20 }]
        [{assign var="product_has_sidebar" value=true}]
    [{else}]
        [{assign var="product_has_sidebar" value=false}]
    [{/if}]

    <div class="row">
        <div class="col-sm-[{if $product_has_sidebar}]18[{else}]24[{/if}] z-product-info-main">
            [{include file="page/details/inc/tabs.tpl"}]
            [{if $oView->getAlsoBoughtTheseProducts()}]
                [{if $device != "phone"}]
                    <div class="hidden-xs">
                        [{include file="widget/product/list.tpl" type="grid" listId="alsoBought" header="light" head="CUSTOMERS_ALSO_BOUGHT"|oxmultilangassign|colon products=$oView->getAlsoBoughtTheseProducts()}]
                    </div>
                [{/if}]
            [{/if}]
            [{if $oView->isReviewActive()}]
                [{if !$oViewConf->getViewThemeParam('blShowReviewTab')}]
                    <div class="hidden-xs">
                        <hr class="z-review-separator">
                        <div class="z-review-wrapper">
                            <h3>[{oxmultilang ident="PRODUCT_REVIEWS"}]</h3>
                            [{assign var="product" value=$oView->getProduct()}]
                            [{if $oxcmp_user}]
                                [{assign var="force_sid" value=$oView->getSidForWidget()}]
                            [{/if}]
                            [{oxid_include_widget cl="oxwReview" nocookie=1 force_sid=$force_sid _parent=$oViewConf->getTopActiveClassName() type=oxarticle anid=$product->oxarticles__oxnid->value aid=$product->oxarticles__oxid->value canrate=$oView->canRate() skipESIforUser=1}]
                        </div>
                    </div>
                [{/if}]
            [{/if}]
        </div>

        [{if $product_has_sidebar && $device != "phone"}]
            <div class="col-sm-6 hidden-xs">
                [{$product_sidebar}]
            </div>
        [{/if}]
    </div>
</div>
