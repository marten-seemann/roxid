[{capture append="oxidBlock_content"}]
    [{* ordering steps *}]
    [{include file="page/checkout/inc/steps.tpl" active=3 }]

    [{capture name="payment_hiddenformelements"}]
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
        <input type="hidden" name="fnc" value="validatepayment">
    [{/capture}]

    [{block name="checkout_payment_main"}]
        [{assign var="currency" value=$oView->getActCurrency()}]
        <div id="z-checkout-shipping-payment" class="row z-checkout-shipping-payment">
            [{block name="change_shipping"}]
                [{if $oView->getAllSets()}]
                    <div class="col-md-12">
                        [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
                        <div class="z-checkout-shipping">
                            <form action="[{ $oViewConf->getSslSelfLink() }]" name="shipping" id="shipping" method="post">
                                <div>
                                    [{$oViewConf->getHiddenSid()}]
                                    [{$oViewConf->getNavFormParams()}]
                                    <input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
                                    <input type="hidden" name="fnc" value="changeshipping">
                                </div>
                                <fieldset>
                                    <legend>[{if $oView->getAllSetsCnt() > 1}][{ oxmultilang ident="SHIPPING_METHOD"}][{else}][{ oxmultilang ident="SHIPPING_METHOD"}][{/if}]</legend>
                                    <div class="z-checkout-shipping-method form-group">
                                        [{block name="act_shipping"}]
                                            [{include file="page/checkout/inc/payment_shipping_selection.tpl"}]
                                        [{/block}]
                                    </div>
                                </fieldset>
                            </form>

                            [{assign var="oDeliveryCostPrice" value=$oxcmp_basket->getDeliveryCost() }]
                            [{if $oDeliveryCostPrice && $oDeliveryCostPrice->getPrice() > 0}]
                                <div id="shipSetCost" class="z-shipping-cost">
                                    [{if $oViewConf->isFunctionalityEnabled('blShowVATForDelivery') }]
                                        [{ oxmultilang ident="CHARGES" suffix="COLON"}] [{oxprice price=$oDeliveryCostPrice->getNettoPrice() currency=$currency}]
                                                ([{ oxmultilang ident="PLUS_VAT" }]
                                                [{oxprice price=$oDeliveryCostPrice->getVatValue() currency=$currency}])
                                    [{else}]
                                        [{ oxmultilang ident="CHARGES" suffix="COLON" }] [{oxprice price=$oDeliveryCostPrice->getBruttoPrice() currency=$currency}]
                                    [{/if}]
                                </div>
                            [{/if}]
                        </div>
                    </div>
                [{/if}]
            [{/block}]

            <div class="col-md-12">
                <div class="z-checkout-payment">
                    [{block name="checkout_payment_errors"}]
                        [{assign var="iPayError" value=$oView->getPaymentError() }]
                        [{ if $iPayError == 1}]
                            <div class="alert alert-danger">[{ oxmultilang ident="ERROR_MESSAGE_COMPLETE_FIELDS_CORRECTLY" }]</div>
                        [{elseif $iPayError == 2}]
                            <div class="alert alert-danger">[{ oxmultilang ident="MESSAGE_PAYMENT_AUTHORIZATION_FAILED" }]</div>
                        [{elseif $iPayError == 4}]
                            <div class="alert alert-danger">[{ oxmultilang ident="MESSAGE_UNAVAILABLE_SHIPPING_METHOD" }]</div>
                        [{elseif $iPayError == 5}]
                            <div class="alert alert-danger">[{ oxmultilang ident="MESSAGE_PAYMENT_UNAVAILABLE_PAYMENT" }]</div>
                        [{elseif $iPayError == 6}]
                            <div class="alert alert-danger">[{ oxmultilang ident="TRUSTED_SHOP_UNAVAILABLE_PROTECTION" }]</div>
                        [{elseif $iPayError > 6}]
                            <!--Add custom error message here-->
                            <div class="alert alert-danger">[{ oxmultilang ident="MESSAGE_PAYMENT_UNAVAILABLE_PAYMENT" }]</div>
                        [{elseif $iPayError == -1}]
                            <div class="alert alert-danger">[{ oxmultilang ident="MESSAGE_PAYMENT_UNAVAILABLE_PAYMENT_ERROR" suffix="COLON" }] "[{ $oView->getPaymentErrorText() }]").</div>
                        [{elseif $iPayError == -2}]
                            <div class="alert alert-danger">[{ oxmultilang ident="MESSAGE_NO_SHIPPING_METHOD_FOUND" }]</div>
                        [{elseif $iPayError == -3}]
                            <div class="alert alert-danger">[{ oxmultilang ident="MESSAGE_PAYMENT_SELECT_ANOTHER_PAYMENT" }]</div>
                        [{elseif $iPayError == -4}]
                            <div class="alert alert-danger">[{ oxmultilang ident="MESSAGE_PAYMENT_BANK_CODE_INVALID" }]</div>
                        [{elseif $iPayError == -5}]
                            <div class="alert alert-danger">[{ oxmultilang ident="MESSAGE_PAYMENT_ACCOUNT_NUMBER_INVALID" }]</div>
                        [{/if}]
                    [{/block}]

                    [{block name="change_payment"}]
                        [{oxscript add="$( '#payment' ).oxPayment();"}]
                        <form action="[{$oViewConf->getSslSelfLink()}]" class="form-horizontal" id="payment" name="order" method="post" data-toggle="roxid-validator">
                            <div>
                                [{$smarty.capture.payment_hiddenformelements}]
                            </div>

                            [{if $oView->getEmptyPayment()}]
                                <input type="hidden" name="paymentid" value="oxempty">
                            [{/if}]

                            [{if $oView->getPaymentList()}]
                                <fieldset>
                                    <legend>[{ oxmultilang ident="PAYMENT_METHOD" }]</legend>
                                    [{ assign var="inptcounter" value="-1"}]
                                    [{foreach key=sPaymentID from=$oView->getPaymentList() item=paymentmethod name=PaymentSelect}]
                                        [{ assign var="inptcounter" value="`$inptcounter+1`"}]
                                        [{block name="select_payment"}]
                                                    [{if $sPaymentID == "oxidcashondel"}]
                                                        [{include file="page/checkout/inc/payment_oxidcashondel.tpl"}]
                                                    [{elseif $sPaymentID == "oxidcreditcard"}]
                                                        [{include file="page/checkout/inc/payment_oxidcreditcard.tpl"}]
                                                    [{elseif $sPaymentID == "oxiddebitnote"}]
                                                        [{include file="page/checkout/inc/payment_oxiddebitnote.tpl"}]
                                                    [{else}]
                                                        [{include file="page/checkout/inc/payment_other.tpl"}]
                                                    [{/if}]
                                        [{/block}]
                                    [{/foreach}]

                                    [{* TRUSTED SHOPS BEGIN *}]
                                    [{include file="page/checkout/inc/trustedshops.tpl"}]
                                    [{* TRUSTED SHOPS END *}]
                                </fieldset>
                            [{/if}]
                            <button type="submit" id="paymentNextStepBottom" style="display: none;">[{ oxmultilang ident="CONTINUE_TO_NEXT_STEP" }] [{$oViewConf->getRoxidIcon('step_next')}]</button>
                        </form>
                    [{/block}]
                </div>
            </div>
            [{if $renderPartial}]
                [{ oxscript }]
            [{/if}]
        </div>

        [{if $oView->getEmptyPayment()}]
            [{block name="checkout_payment_nopaymentsfound"}]
                <div class="page-header">
                    <h1>[{ oxmultilang ident="PAYMENT_INFORMATION" }]</h1>
                </div>
                [{oxifcontent ident="oxnopaymentmethod" object="oCont"}]
                    [{$oCont->oxcontents__oxcontent->value}]
                [{/oxifcontent}]
            [{/block}]
        [{/if}]

        [{block name="checkout_payment_nextstep"}]
            [{if $oView->isLowOrderPrice()}]
                <div class="alert alert-danger">[{ oxmultilang ident="MIN_ORDER_PRICE" suffix="COLON"}] [{oxprice price=$oxcmp_basket->getMinOrderPrice() currency=$currency}]</div>
            [{else}]
                <div class="z-checkout-controls z-checkout-controls-bottom">
                    <a href="[{ oxgetseourl ident=$oViewConf->getOrderLink() }]" class="btn btn-default" id="paymentBackStepBottom">[{$oViewConf->getRoxidIcon('step_back')}] [{ oxmultilang ident="PREVIOUS_STEP" }]</a>
                    <button type="submit" name="userform" class="btn btn-primary pull-right hidden-xs" id="paymentNextStepDummyBottom" form="payment">[{ oxmultilang ident="CONTINUE_TO_NEXT_STEP" }] [{$oViewConf->getRoxidIcon('step_next')}]</button>
                    <button type="submit" name="userform" class="btn btn-primary pull-right visible-xs" id="paymentNextStepDummyBottomMobile" form="payment">[{ oxmultilang ident="CONTINUE_TO_NEXT_STEP_MOBILE" }] [{$oViewConf->getRoxidIcon('step_next')}]</button>
                    <div class="clear"></div>
                </div>
            [{/if}]
        [{/block}]

    [{/block}]
[{/capture}]

[{if !$renderPartial}]
    [{include file="layout/page.tpl"}]
[{else}]
    [{foreach from=$oxidBlock_content item="_block" name="blocks"}]
        [{$_block}]
    [{/foreach}]
[{/if}]
