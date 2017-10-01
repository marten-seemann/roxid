[{block name="checkout_steps_main"}]
    <div class="z-checkout-steps wizard">
        <ul>
            [{if $oxcmp_basket->getProductsCount() }]
                [{assign var=showStepLinks value=true}]
            [{/if}]

            [{block name="checkout_steps_basket"}]
                <li class="step1[{ if $active == 1}] active [{elseif $active > 1}] passed [{/if}]">
                    <span class="z-steps-number">1.</span>
                    <div class="z-steps-title hidden-xs">
                        [{if $showStepLinks}]<a rel="nofollow" href="[{ oxgetseourl ident=$oViewConf->getBasketLink() }]">[{/if}]
                        <span class="visible-lg-inline">[{ oxmultilang ident="STEPS_BASKET" }]</span>
                        <span class="hidden-lg">[{ oxmultilang ident="STEPS_BASKET_MOBILE" }]</span>
                        [{if $showStepLinks}]</a>[{/if}]
                    </div>
                </li>
            [{/block}]

            [{assign var=showStepLinks value=false}]
            [{if !$oView->isLowOrderPrice() && $oxcmp_basket->getProductsCount() }]
                [{assign var=showStepLinks value=true}]
            [{/if}]

            [{block name="checkout_steps_send"}]
                <li class="step2[{ if $active == 2}] active [{elseif $active > 2}] passed [{/if}]">
                    <span class="z-steps-number">2.</span>
                    <div class="z-steps-title hidden-xs">
                        [{if $showStepLinks}]<a rel="nofollow" href="[{ oxgetseourl ident=$oViewConf->getOrderLink() }]">[{/if}]
                        <span class="visible-lg-inline">[{ oxmultilang ident="STEPS_SEND" }]</span>
                        <span class="hidden-lg">[{ oxmultilang ident="STEPS_SEND_MOBILE" }]</span>
                        [{if $showStepLinks}]</a>[{/if}]
                    </div>
                </li>
            [{/block}]

            [{assign var=showStepLinks value=false}]
            [{if $active != 1 && $oxcmp_user && !$oView->isLowOrderPrice() && $oxcmp_basket->getProductsCount() }]
                [{assign var=showStepLinks value=true}]
            [{/if}]

            [{block name="checkout_steps_pay"}]
                <li class="step3[{ if $active == 3}] active [{elseif $active > 3}] passed [{/if}]">
                    <span class="z-steps-number">3.</span>
                    <div class="z-steps-title hidden-xs">
                        [{if $showStepLinks}]<a rel="nofollow" [{if $oViewConf->getActiveClassName() == "user"}]id="paymentStep"[{/if}] href="[{ oxgetseourl ident=$oViewConf->getPaymentLink() }]">[{/if}]
                        <span class="visible-lg-inline">[{ oxmultilang ident="STEPS_PAY" }]</span>
                        <span class="hidden-lg">[{ oxmultilang ident="STEPS_PAY" }]</span>
                        [{if $showStepLinks}]</a>[{/if}]
                    </div>
                </li>
                [{oxscript add="$('#paymentStep').click( function() { $('#userNextStepBottom').click();return false;});"}]
            [{/block}]

            [{assign var=showStepLinks value=false}]
            [{if $active != 1 && $oxcmp_user && $oxcmp_basket->getProductsCount() && $oView->getPaymentList() && !$oView->isLowOrderPrice()}]
                [{assign var=showStepLinks value=true}]
            [{/if}]

            [{block name="checkout_steps_order"}]
                <li class="step4[{ if $active == 4}] active [{elseif $active > 4}] passed [{/if}]">
                    <span class="z-steps-number">4.</span>
                    <div class="z-steps-title hidden-xs">
                        [{if $showStepLinks}]<a rel="nofollow" [{if $oViewConf->getActiveClassName() == "payment"}]id="orderStep"[{/if}] href="[{ if $oViewConf->getActiveClassName() == "payment"}]javascript:document.forms.order.submit();[{else}][{ oxgetseourl ident=$oViewConf->getOrderConfirmLink() }][{/if}]">[{/if}]
                        <span class="visible-lg-inline">[{ oxmultilang ident="STEPS_ORDER" }]</span>
                        <span class="hidden-lg">[{ oxmultilang ident="STEPS_ORDER_MOBILE" }]</span>
                        [{if $showStepLinks}]</a>[{/if}]
                    </div>
                </li>
                [{oxscript add="$('#orderStep').click( function() { $('#paymentNextStepBottom').click();return false;});"}]
            [{/block}]

            [{block name="checkout_steps_laststep"}]
                <li class="step5[{ if $active == 5}] active activeLast [{else}] defaultLast [{/if}] ">
                    <span class="z-steps-number">5.</span>
                    <div class="z-steps-title hidden-xs">[{ oxmultilang ident="READY" }]</div>
                </li>
            [{/block}]
        </ul>
        <div class="clear"></div>
    </div>
[{/block}]
