[{block name="user_checkout_change"}]
    <form class="form-horizontal" action="[{ $oViewConf->getSslSelfLink() }]" name="order" method="post" data-toggle="roxid-validator">
        [{block name="user_checkout_change_form"}]
            [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
            [{ $oViewConf->getHiddenSid() }]
            [{ $oViewConf->getNavFormParams() }]
            <input type="hidden" name="cl" value="user">
            <input type="hidden" name="option" value="[{$oView->getLoginOption()}]">
            <input type="hidden" name="fnc" value="changeuser">
            <input type="hidden" name="lgn_cook" value="0">
            <input type="hidden" name="blshowshipaddress" value="1">

            [{block name="user_checkout_change_next_step_top"}]
                <div class="z-checkout-controls z-checkout-controls-top">
                    <a href="[{ oxgetseourl ident=$oViewConf->getBasketLink() }]" class="btn btn-default" id="userBackStepTop">[{$oViewConf->getRoxidIcon('step_back')}] [{ oxmultilang ident="PREVIOUS_STEP" }]</a>
                    <button id="userNextStepTop" class="btn btn-primary pull-right hidden-xs" name="userform" type="submit">[{ oxmultilang ident="CONTINUE_TO_NEXT_STEP" }] [{$oViewConf->getRoxidIcon('step_next')}]</button>
                    <button id="userNextStepTop2" class="btn btn-primary pull-right visible-xs" name="userform" type="submit">[{ oxmultilang ident="CONTINUE_TO_NEXT_STEP_MOBILE" }] [{$oViewConf->getRoxidIcon('step_next')}]</button>
                    <div class="clear"></div>
                </div>
            [{/block}]

            <div class="row z-checkout-addresses">
                <div class="col-md-12">
                    [{block name="user_checkout_billing"}]
                        <fieldset>
                            [{block name="user_checkout_billing_head"}]
                                <legend>
                                    [{oxmultilang ident="BILLING_ADDRESS" }]
                                    <button id="userChangeAddress" class="btn btn-default btn-sm" name="changeBillAddress" type="submit">[{$oViewConf->getRoxidIcon('edit')}] [{oxmultilang ident="CHANGE" }]</button>
                                </legend>
                            [{/block}]
                            [{block name="user_checkout_billing_form"}]
                                <div id="addressForm" style="display: none;">
                                    [{include file="form/fieldset/user_billing.tpl" noFormSubmit=true blSubscribeNews=true blOrderRemark=true}]
                                </div>
                            [{/block}]
                            [{block name="user_checkout_billing_feedback"}]
                                <div id="addressText">
                                    [{include file="widget/address/billing_address.tpl" noFormSubmit=true blSubscribeNews=true blOrderRemark=true}]
                                </div>
                            [{/block}]
                        </fieldset>
                    [{/block}]
                </div>
                <div class="col-md-12">
                    [{block name="user_checkout_shipping"}]
                        <fieldset>
                            [{block name="user_checkout_shipping_head"}]
                                <legend>
                                    [{ oxmultilang ident="SHIPPING_ADDRESS" }]
                                </legend>
                            [{/block}]
                            [{block name="user_checkout_shipping_change"}]
                                [{include file="form/fieldset/user_billing_for_shipping.tpl"}]
                            [{/block}]
                            [{block name="user_checkout_shipping_form"}]
                                <div id="shippingAddress" class="z-checkout-shipping-address" [{if !$oView->showShipAddress()}]style="display: none;"[{/if}]>
                                    [{include file="form/fieldset/user_shipping.tpl" noFormSubmit=true onChangeClass='user' showChangeButton=true}]
                                </div>
                            [{/block}]
                            [{block name="user_checkout_shipping_feedback"}]
                                [{include file="form/fieldset/order_newsletter.tpl" blSubscribeNews=true}]
                                [{include file="form/fieldset/order_remark.tpl" blOrderRemark=true}]
                            [{/block}]
                        </fieldset>
                    [{/block}]
                </div>
            </div>

            [{block name="user_checkout_change_next_step_bottom"}]
                <div class="z-checkout-controls z-checkout-controls-bottom">
                    <a href="[{ oxgetseourl ident=$oViewConf->getBasketLink() }]" class="btn btn-default" id="userBackStepBottom">[{$oViewConf->getRoxidIcon('step_back')}] [{ oxmultilang ident="PREVIOUS_STEP" }]</a>
                    <button id="userNextStepBottom" class="btn btn-primary pull-right hidden-xs" name="userform" type="submit">[{ oxmultilang ident="CONTINUE_TO_NEXT_STEP" }] [{$oViewConf->getRoxidIcon('step_next')}]</button>
                    <button id="userNextStepBottom2" class="btn btn-primary pull-right visible-xs" name="userform" type="submit">[{ oxmultilang ident="CONTINUE_TO_NEXT_STEP_MOBILE" }] [{$oViewConf->getRoxidIcon('step_next')}]</button>
                    <div class="clear"></div>
                </div>
            [{/block}]
        [{/block}]
    </form>
    [{include file="form/fieldset/delete_shipping_address_modal.tpl"}]
[{/block}]
