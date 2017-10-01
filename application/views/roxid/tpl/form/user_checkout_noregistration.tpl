[{block name="user_checkout_noregistration"}]
    <form class="form-horizontal" action="[{ $oViewConf->getSslSelfLink() }]" name="order" method="post" data-toggle="roxid-validator">
        [{block name="user_checkout_noregistration_form"}]
            [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
            [{ $oViewConf->getHiddenSid() }]
            [{ $oViewConf->getNavFormParams() }]
            <input type="hidden" name="cl" value="user">
            <input type="hidden" name="option" value="1">
            [{if !$oxcmp_user->oxuser__oxpassword->value }]
            <input type="hidden" name="fnc" value="createuser">
            [{else}]
            <input type="hidden" name="fnc" value="changeuser">
            <input type="hidden" name="lgn_cook" value="0">
            [{/if}]
            <input type="hidden" id="reloadAddress" name="reloadaddress" value="">
            <input type="hidden" name="blshowshipaddress" value="1">

            [{block name="user_checkout_noregistration_next_step_top"}]
                <div class="z-checkout-controls z-checkout-controls-top">
                    <a href="[{ oxgetseourl ident=$oViewConf->getBasketLink() }]" class="btn btn-default" id="userBackStepTop">[{$oViewConf->getRoxidIcon('step_back')}] [{ oxmultilang ident="PREVIOUS_STEP" }]</a>
                    <button id="userNextStepTop" class="btn btn-primary pull-right hidden-xs" name="userform" type="submit">[{ oxmultilang ident="CONTINUE_TO_NEXT_STEP" }] [{$oViewConf->getRoxidIcon('step_next')}]</button>
                    <button id="userNextStepTop2" class="btn btn-primary pull-right visible-xs" name="userform" type="submit">[{ oxmultilang ident="CONTINUE_TO_NEXT_STEP_MOBILE" }] [{$oViewConf->getRoxidIcon('step_next')}]</button>
                    <div class="clear"></div>
                </div>
            [{/block}]

            <div class="row z-checkout-customerinfo">
                <div class="col-md-20 col-lg-18">
                    <fieldset>
                        <legend>[{ oxmultilang ident="NOTREGISTERED_ACCOUNTINFO" }]</legend>
                        [{ include file="form/fieldset/user_noaccount.tpl" }]
                    </fieldset>
                </div>
            </div>
            <div class="row z-checkout-addresses">
                <div class="col-md-12">
                    <fieldset>
                        <legend>[{ oxmultilang ident="BILLING_ADDRESS" }]</legend>
                        [{ include file="form/fieldset/user_billing.tpl" noFormSubmit=true blOrderRemark=true}]
                    </fieldset>
                </div>
                <div class="col-md-12">
                    <fieldset>
                        <legend>[{ oxmultilang ident="SHIPPING_ADDRESS" }]</legend>
                        [{include file="form/fieldset/user_billing_for_shipping.tpl"}]
                        <div id="shippingAddress" class="z-checkout-shipping-address" [{if !$oView->showShipAddress()}]style="display: none;"[{/if}]>
                            [{ include file="form/fieldset/user_shipping.tpl" noFormSubmit=true}]
                        </div>
                        [{include file="form/fieldset/order_remark.tpl" blOrderRemark=true}]
                    </fieldset>
                </div>
            </div>

            [{block name="user_checkout_noregistration_next_step_bottom"}]
                <div class="z-checkout-controls z-checkout-controls-bottom">
                    <a href="[{ oxgetseourl ident=$oViewConf->getBasketLink() }]" class="btn btn-default" id="userBackStepBottom">[{$oViewConf->getRoxidIcon('step_back')}] [{ oxmultilang ident="PREVIOUS_STEP" }]</a>
                    <button id="userNextStepBottom" class="btn btn-primary pull-right hidden-xs" name="userform" type="submit">[{ oxmultilang ident="CONTINUE_TO_NEXT_STEP" }] [{$oViewConf->getRoxidIcon('step_next')}]</button>
                    <button id="userNextStepBottom2" class="btn btn-primary pull-right visible-xs" name="userform" type="submit">[{ oxmultilang ident="CONTINUE_TO_NEXT_STEP_MOBILE" }] [{$oViewConf->getRoxidIcon('step_next')}]</button>
                    <div class="clear"></div>
                </div>
            [{/block}]
        [{/block}]
    </form>
[{/block}]
