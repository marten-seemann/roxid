[{capture append="oxidBlock_content"}]

    [{* ordering steps *}]
    [{include file="page/checkout/inc/steps.tpl" active=1 }]

    [{insert name="oxid_tracker" title=$template_title }]

    [{block name="checkout_basket_main"}]
        [{oxscript add="$('#content').ajaxBasket()"}]
        [{assign var="currency" value=$oView->getActCurrency() }]
        [{if !$oxcmp_basket->getProductsCount()  }]
            [{block name="checkout_basket_emptyshippingcart"}]
                <div class="alert alert-danger">[{ oxmultilang ident="BASKET_EMPTY" }]</div>
            [{/block}]
        [{else }]
            [{if $oView->isLowOrderPrice() }]
                [{block name="checkout_basket_loworderprice_top"}]
                    <div class="alert alert-danger" role="alert">[{ oxmultilang ident="MIN_ORDER_PRICE" suffix="COLON"}] [{ $oView->getMinOrderPrice() }] [{ $currency->sign }]</div>
                    <div class="clear"></div>
                [{/block}]
            [{/if}]
            [{block name="checkout_basket_next_step_top"}]
                <div class="z-checkout-controls z-checkout-controls-top hidden-phone">
                    [{if $oView->showBackToShop()}]
                        [{block name="checkout_basket_backtoshop_top"}]
                            <div class="backtoshop pull-left">
                                <form action="[{ $oViewConf->getSslSelfLink() }]" method="post">
                                    [{ $oViewConf->getHiddenSid() }]
                                    <input type="hidden" name="cl" value="basket">
                                    <input type="hidden" name="fnc" value="backtoshop">
                                    <button type="submit" class="btn btn-default">[{$oViewConf->getRoxidIcon('step_back')}] [{ oxmultilang ident="CONTINUE_SHOPPING" }]</button>
                                </form>
                            </div>
                        [{/block}]
                    [{/if}]
                    [{if !$oView->isLowOrderPrice() }]
                        [{block name="basket_btn_next_top"}]
                            <form action="[{ $oViewConf->getSslSelfLink() }]" method="post">
                                [{ $oViewConf->getHiddenSid() }]
                                <input type="hidden" name="cl" value="user">
                                <button type="submit" class="btn btn-primary pull-right hidden-xs">[{ oxmultilang ident="PAGE_CHECKOUT_BASKET_NEXTSTEP" }] [{$oViewConf->getRoxidIcon('step_next')}]</button>
                                <button type="submit" class="btn btn-primary pull-right visible-xs">[{ oxmultilang ident="CONTINUE_TO_NEXT_STEP_MOBILE" }] [{$oViewConf->getRoxidIcon('step_next')}]</button>
                            </form>
                        [{/block}]
                    [{/if}]
                    <div class="clear"></div>
                </div>
            [{/block}]

            [{include file="page/checkout/inc/basket_wrapper.tpl" editable=true}]

            <input type="hidden" id="basket_item_count" value="[{$oxcmp_basket->getItemsCount()}]">
            <input type="hidden" id="basket_total_price" value="[{if $oxcmp_basket->isPriceViewModeNetto()}][{ $oxcmp_basket->getProductsNetPrice()}][{else}][{ $oxcmp_basket->getFProductsPrice()}][{/if}] [{ $currency->sign}]">

            [{block name="checkout_basket_next_step_bottom"}]
                <div class="z-checkout-controls z-checkout-controls-bottom">
                    [{if $oView->showBackToShop()}]
                        [{block name="checkout_basket_backtoshop_bottom"}]
                            <form action="[{ $oViewConf->getSslSelfLink() }]" method="post">
                                <div class="backtoshop pull-left">
                                    [{ $oViewConf->getHiddenSid() }]
                                    <input type="hidden" name="cl" value="basket">
                                    <input type="hidden" name="fnc" value="backtoshop">
                                    <button type="submit" class="btn btn-default">[{$oViewConf->getRoxidIcon('step_back')}] [{ oxmultilang ident="CONTINUE_SHOPPING" }]</button>
                                </div>
                            </form>
                        [{/block}]
                    [{/if}]

                    [{if $oView->isLowOrderPrice() }]
                        [{*block name="checkout_basket_loworderprice_bottom"}]
                            <div>[{ oxmultilang ident="MIN_ORDER_PRICE" }] [{ $oView->getMinOrderPrice() }] [{ $currency->sign }]</div>
                        [{/block*}]
                    [{else}]
                        [{block name="basket_btn_next_bottom"}]
                            <form action="[{ $oViewConf->getSslSelfLink() }]" method="post">
                                [{ $oViewConf->getHiddenSid() }]
                                <input type="hidden" name="cl" value="user">
                                <button type="submit" class="btn btn-primary pull-right hidden-xs">[{ oxmultilang ident="CONTINUE_TO_NEXT_STEP" }] [{$oViewConf->getRoxidIcon('step_next')}]</button>
                                <button type="submit" class="btn btn-primary pull-right visible-xs">[{ oxmultilang ident="CONTINUE_TO_NEXT_STEP_MOBILE" }] [{$oViewConf->getRoxidIcon('step_next')}]</button>
                            </form>
                        [{/block}]
                    [{/if}]
                    <div class="clear"></div>
                </div>
            [{/block}]
        [{/if }]
        [{if $oView->isWrapping() }]
           [{include file="page/checkout/inc/wrapping.tpl"}]
        [{/if}]
    [{/block}]

    [{*include file="page/checkout/inc/basket.tpl"*}]
[{/capture}]

[{if !$renderPartial}]
    [{include file="layout/page.tpl"}]
[{else}]
    [{foreach from=$oxidBlock_content item="_block" name="blocks"}]
        [{$_block}]
    [{/foreach}]
[{/if}]
