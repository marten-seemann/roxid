[{capture append="oxidBlock_content"}]

    [{block name="checkout_order_errors"}]
        [{if $oView->isConfirmAGBError() == 1}]
            [{include file="message/error.tpl" statusMessage="READ_AND_CONFIRM_TERMS"|oxmultilangassign}]
        [{/if}]
        [{assign var="iError" value=$oView->getAddressError()}]
        [{if $iError == 1}]
           [{include file="message/error.tpl" statusMessage="ERROR_DELIVERY_ADDRESS_WAS_CHANGED_DURING_CHECKOUT"|oxmultilangassign}]
        [{/if}]
    [{/block}]

    [{* ordering steps *}]
    [{include file="page/checkout/inc/steps.tpl" active=4}]

    [{block name="checkout_order_main"}]
        [{*if !$oView->showOrderButtonOnTop()}]
            <div class="lineBox clear">
                <span>&nbsp;</span>
                <span class="title">[{oxmultilang ident="MESSAGE_SUBMIT_BOTTOM"}]</span>
            </div>
        [{/if*}]

        [{block name="checkout_order_details"}]
            [{ if !$oxcmp_basket->getProductsCount()  }]
                [{block name="checkout_order_emptyshippingcart"}]
                    <div class="alert alert-danger">[{ oxmultilang ident="BASKET_EMPTY" }]</div>
                [{/block}]
            [{else}]
                [{assign var="currency" value=$oView->getActCurrency() }]

                [{block name="checkout_order_next_step_top"}]
                    [{if $oView->isLowOrderPrice()}]
                        [{block name="checkout_order_loworderprice_top"}]
                            <div class="alert alert-danger">[{ oxmultilang ident="MIN_ORDER_PRICE" suffix="COLON"}] [{$oView->getMinOrderPrice()}] [{$currency->sign}]</div>
                        [{/block}]
                    [{else}]
                        [{block name="checkout_order_btn_confirm_top"}]
                            [{if $oView->showOrderButtonOnTop()}]
                                <div id="orderAgbTop" class="z-order-section">
                                    <form class="form-horizontal" action="[{$oViewConf->getSslSelfLink()}]" method="post" id="orderConfirmAgbTop">
                                        [{ $oViewConf->getHiddenSid() }]
                                        [{ $oViewConf->getNavFormParams() }]
                                        <input type="hidden" name="cl" value="order">
                                        <input type="hidden" name="fnc" value="[{$oView->getExecuteFnc()}]">
                                        <input type="hidden" name="challenge" value="[{$challenge}]">
                                        <input type="hidden" name="sDeliveryAddressMD5" value="[{$oView->getDeliveryAddressMD5()}]">

                                        [{include file="page/checkout/inc/agb.tpl"}]

                                        <div class="z-checkout-controls z-checkout-controls-top">
                                            <a href="[{ oxgetseourl ident=$oViewConf->getPaymentLink() }]" class="btn btn-default">[{$oViewConf->getRoxidIcon('step_back')}] [{ oxmultilang ident="PREVIOUS_STEP" }]</a>
                                            <button type="submit" class="btn btn-success pull-right">[{ oxmultilang ident="SUBMIT_ORDER" }]</button>
                                            <div class="clear"></div>
                                        </div>
                                    </form>
                                </div>
                            [{/if}]
                        [{/block}]
                    [{/if}]
                [{/block}]

                [{block name="checkout_order_vouchers"}]
                    [{ if $oViewConf->getShowVouchers() && $oxcmp_basket->getVouchers()}]
                        [{ oxmultilang ident="USED_COUPONS" suffix="COLON"}]
                        <div>
                            [{foreach from=$Errors.basket item=oEr key=key}]
                                [{if $oEr->getErrorClassType() == 'oxVoucherException'}]
                                    [{oxmultilang ident="COUPON_NOT_ACCEPTED" args=$oEr->getValue('voucherNr')}]<br>
                                    [{oxmultilang ident="REASON" suffix="COLON"}]
                                    [{$oEr->getOxMessage()}]<br>
                                [{/if}]
                            [{/foreach}]

                            <ul>
                                [{foreach from=$oxcmp_basket->getVouchers() item=sVoucher key=key name=aVouchers}]
                                    <li>[{$sVoucher->sVoucherNr}]</li>
                                [{/foreach}]
                            </ul>
                        </div>
                    [{/if}]
                [{/block}]

                <div id="z-order-addresses" class="row z-order-section">
                    [{if $oView->getDelAddress()}]
                        [{assign var="address_col_width" value="14"}]
                    [{else}]
                        [{assign var="address_col_width" value="12"}]
                    [{/if}]
                    [{math equation="24-x" x=$address_col_width assign="shipping_col_width"}]

                    <div class="col-md-[{$address_col_width}]">
                        [{block name="checkout_order_address"}]
                            <div id="orderAddress">
                                <form action="[{ $oViewConf->getSslSelfLink() }]" method="post">
                                    <fieldset>
                                        <input type="hidden" name="cl" value="user">
                                        <input type="hidden" name="fnc" value="">
                                        [{$oViewConf->getHiddenSid()}]
                                        <legend>
                                            [{ oxmultilang ident="ADDRESSES" }]
                                            <button type="submit" class="btn btn-default btn-sm">[{$oViewConf->getRoxidIcon('edit')}] [{ oxmultilang ident="EDIT" }]</button>
                                        </legend>
                                        <div class="row">
                                            <div class="col-sm-13">
                                                <dl>
                                                    <dt>[{oxmultilang ident="BILLING_ADDRESS" suffix="COLON"}]</dt>
                                                    <dd>
                                                        [{include file="widget/address/billing_address.tpl"}]
                                                    </dd>
                                                </dl>
                                                <div class="clear"></div>
                                            </div>
                                            <div class="col-sm-11">
                                                [{assign var="oDelAdress" value=$oView->getDelAddress()}]
                                                [{if $oDelAdress}]
                                                    <dl>
                                                        <dt>[{oxmultilang ident="SHIPPING_ADDRESS" suffix="COLON"}]</dt>
                                                        <dd>
                                                            [{include file="widget/address/shipping_address.tpl" delivadr=$oDelAdress}]
                                                        </dd>
                                                    </dl>
                                                    <div class="clear"></div>
                                                [{/if}]
                                            </div>
                                        </div>

                                        [{if $oView->getOrderRemark()}]
                                            <dl class="orderRemarks">
                                                <dt>[{oxmultilang ident="WHAT_I_WANTED_TO_SAY" suffix="COLON"}]</dt>
                                                <dd>
                                                    <blockquote>
                                                        <p>[{$oView->getOrderRemark()}]</p>
                                                    </blockquote>
                                                </dd>
                                            </dl>
                                        [{/if}]
                                    </fieldset>
                                </form>
                            </div>
                            <div class="clear"></div>
                        [{/block}]
                    </div>

                    <div class="col-md-[{$shipping_col_width}]">
                        [{block name="shippingAndPayment"}]
                            <form action="[{ $oViewConf->getSslSelfLink() }]" method="post">
                                <fieldset>
                                    <input type="hidden" name="cl" value="payment">
                                    <input type="hidden" name="fnc" value="">
                                    [{ $oViewConf->getHiddenSid() }]
                                    <legend>
                                        <span class="hidden-xs">[{oxmultilang ident="ORDER_PAYMENT_SHIPPING"}]</span>
                                        <span class="visible-xs-inline">[{oxmultilang ident="ORDER_PAYMENT_SHIPPING_MOBILE"}]</span>
                                        <button type="submit" class="btn btn-default btn-sm">[{$oViewConf->getRoxidIcon('edit')}] [{ oxmultilang ident="EDIT" }]</button>
                                    </legend>

                                    <div id="orderShipping">
                                        [{assign var="oShipSet" value=$oView->getShipSet() }]
                                        <dl>
                                            <dt>[{oxmultilang ident="SHIPPING_CARRIER" suffix="COLON"}]</dt>
                                            <dd>[{ $oShipSet->oxdeliveryset__oxtitle->value }]</dd>
                                        </dl>
                                    </div>
                                    <div id="orderPayment">
                                        [{assign var="payment" value=$oView->getPayment()}]
                                        <dl>
                                            <dt>[{oxmultilang ident="PAYMENT_METHOD" suffix="COLON"}]</dt>
                                            <dd>[{$payment->oxpayments__oxdesc->value}]</dd>
                                        </dl>
                                    </div>
                                </fieldset>
                            </form>
                        [{/block}]
                    </div>
                </div>

                <div id="orderEditCart" class="z-order-section">
                    <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
                        <fieldset>
                            [{ $oViewConf->getHiddenSid() }]
                            <input type="hidden" name="cl" value="basket">
                            <input type="hidden" name="fnc" value="">
                            <legend>
                                [{oxmultilang ident="CART"}]
                                <button type="submit" class="btn btn-default btn-sm">[{$oViewConf->getRoxidIcon('edit')}] [{ oxmultilang ident="EDIT"}]</button>
                            </legend>
                        </fieldset>
                    </form>
                </div>

                [{block name="order_basket"}]
                    [{include file="page/checkout/inc/basket_wrapper.tpl" editable=false}]
                [{/block}]

                [{block name="checkout_order_next_step_bottom"}]
                    [{if $oView->isLowOrderPrice()}]
                        [{block name="checkout_order_loworderprice_bottom"}]
                            <div class="alert alert-danger">[{ oxmultilang ident="MIN_ORDER_PRICE" suffix="COLON"}] [{$oView->getMinOrderPrice()}] [{$currency->sign}]</div>
                        [{/block}]
                    [{else}]
                        [{block name="checkout_order_btn_confirm_bottom"}]
                            <form action="[{ $oViewConf->getSslSelfLink() }]" method="post" id="orderConfirmAgbBottom">
                                [{$oViewConf->getHiddenSid()}]
                                [{$oViewConf->getNavFormParams()}]
                                <input type="hidden" name="cl" value="order">
                                <input type="hidden" name="fnc" value="[{$oView->getExecuteFnc()}]">
                                <input type="hidden" name="challenge" value="[{$challenge}]">
                                <input type="hidden" name="sDeliveryAddressMD5" value="[{$oView->getDeliveryAddressMD5()}]">

                                [{if $oViewConf->isFunctionalityEnabled("blShowTSInternationalFeesMessage")}]
                                    [{oxifcontent ident="oxtsinternationalfees" object="oTSIFContent"}]
                                        <div class="alert alert-info">
                                            [{$oTSIFContent->oxcontents__oxcontent->value}]
                                        </div>
                                    [{/oxifcontent}]
                                [{/if}]

                                [{if $payment->oxpayments__oxid->value eq "oxidcashondel" && $oViewConf->isFunctionalityEnabled("blShowTSCODMessage")}]
                                    [{oxifcontent ident="oxtscodmessage" object="oTSCODContent"}]
                                        <div class="alert alert-info">
                                            [{$oTSCODContent->oxcontents__oxcontent->value}]
                                        </div>
                                    [{/oxifcontent}]
                                [{/if}]

                                [{if !$oView->showOrderButtonOnTop()}]
                                    [{include file="page/checkout/inc/agb.tpl"}]
                                [{else}]
                                    [{include file="page/checkout/inc/agb.tpl" hideButtons=true}]
                                [{/if}]

                                <div class="z-checkout-controls z-checkout-controls-bottom">
                                    <a href="[{ oxgetseourl ident=$oViewConf->getPaymentLink() }]" class="btn btn-default">[{$oViewConf->getRoxidIcon('step_back')}] [{oxmultilang ident="PREVIOUS_STEP"}]</a>
                                    <button type="submit" class="btn btn-success pull-right">[{oxmultilang ident="SUBMIT_ORDER"}]</button>
                                    <div class="clear"></div>
                                </div>
                            </form>
                        [{/block}]
                    [{/if}]
                [{/block}]
            [{/if}]
        [{/block}]
    [{/block}]
[{/capture}]

[{include file="layout/page.tpl"}]
