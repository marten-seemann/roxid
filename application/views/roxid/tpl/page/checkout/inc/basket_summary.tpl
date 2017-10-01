[{block name="checkout_basketcontents_summary"}]
    <div id="basketSummary" class="z-basket-summary">
        [{*  basket summary  *}]
        <table>
            [{if !( $oxcmp_basket->getDiscounts() || ($oViewConf->getShowVouchers() && $oxcmp_basket->getVoucherDiscValue())  )}]
                [{block name="checkout_basketcontents_nodiscounttotalnet"}]
                    <tr>
                        <th>[{ oxmultilang ident="TOTAL_NET" suffix="COLON" }]</th>
                        <td id="basketTotalProductsNetto">[{oxprice price=$oxcmp_basket->getNettoSum() currency=$currency}]</td>
                    </tr>
                [{/block}]

                [{block name="checkout_basketcontents_nodiscountproductvats"}]
                    [{foreach from=$oxcmp_basket->getProductVats(false) item=VATitem key=key }]
                        <tr>
                            <th>[{ oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$key }]</th>
                            <td>[{oxprice price=$VATitem currency=$currency }]</td>
                        </tr>
                    [{/foreach }]
                [{/block}]

                [{block name="checkout_basketcontents_nodiscounttotalgross"}]
                    <tr>
                        <th>[{ oxmultilang ident="TOTAL_GROSS" suffix="COLON"}]</th>
                        <td id="basketTotalProductsGross">[{oxprice price=$oxcmp_basket->getBruttoSum() currency=$currency}]</td>
                    </tr>
                [{/block}]
            [{else}]
                [{if $oxcmp_basket->isPriceViewModeNetto() }]
                    [{block name="checkout_basketcontents_discounttotalnet"}]
                        <tr>
                            <th>[{ oxmultilang ident="TOTAL_NET" suffix="COLON" }]</th>
                            <td id="basketTotalProductsNetto">[{oxprice price=$oxcmp_basket->getNettoSum() currency=$currency }]</td>
                        </tr>
                    [{/block}]
                [{else}]
                     [{block name="checkout_basketcontents_discounttotalgross"}]
                        <tr>
                            <th>[{ oxmultilang ident="TOTAL_GROSS" suffix="COLON" }]</th>
                            <td id="basketTotalProductsGross">[{oxprice price=$oxcmp_basket->getBruttoSum() currency=$currency}]</td>
                        </tr>
                    [{/block}]
                [{/if}]

                [{block name="checkout_basketcontents_discounts"}]
                    [{foreach from=$oxcmp_basket->getDiscounts() item=oDiscount name=test_Discounts}]
                        <tr>
                            <th>
                                [{if $oDiscount->dDiscount < 0 }][{ oxmultilang ident="SURCHARGE" }][{else}][{ oxmultilang ident="DISCOUNT" }][{/if}]&nbsp;[{ $oDiscount->sDiscount }]
                            </th>
                            <td>
                                [{oxprice price=$oDiscount->dDiscount*-1 currency=$currency}]
                            </td>
                        </tr>
                    [{/foreach }]
                [{/block}]

                [{block name="checkout_basketcontents_voucherdiscount"}]
                    [{if $oViewConf->getShowVouchers() && $oxcmp_basket->getVoucherDiscValue() }]
                        [{foreach from=$oxcmp_basket->getVouchers() item=sVoucher key=key name=Voucher}]
                            <tr class="couponData">
                                <th><span>[{ oxmultilang ident="COUPON" }]&nbsp;([{ oxmultilang ident="NUMBER_2" }] [{ $sVoucher->sVoucherNr }]):</span>
                                [{if $editable }]
                                    <a href="[{ $oViewConf->getSelfLink() }]&amp;cl=basket&amp;fnc=removeVoucher&amp;voucherId=[{ $sVoucher->sVoucherId }]&amp;CustomError=basket" class="removeFn btn btn-danger btn-xs" rel="nofollow">[{$oViewConf->getRoxidIcon('remove')}] [{ oxmultilang ident="REMOVE" }]</a>
                                [{/if}]
                                </th>
                                <td>[{oxprice price=$sVoucher->dVoucherdiscount*-1 currency=$currency}]</td>
                            </tr>
                        [{/foreach }]
                    [{/if }]
                [{/block}]

                [{if !$oxcmp_basket->isPriceViewModeNetto() }]
                    [{block name="checkout_basketcontents_totalnet"}]
                        <tr>
                            <th>[{ oxmultilang ident="TOTAL_NET" suffix="COLON" }]</th>
                            <td id="basketTotalNetto">[{oxprice price=$oxcmp_basket->getNettoSum() currency=$currency }]</td>
                        </tr>
                    [{/block}]
                [{/if}]

                [{block name="checkout_basketcontents_productvats"}]
                    [{foreach from=$oxcmp_basket->getProductVats(false) item=VATitem key=key }]
                        <tr>
                            <th>[{ oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$key }]</th>
                            <td>[{oxprice price=$VATitem currency=$currency }]</td>
                        </tr>
                    [{/foreach }]
                [{/block}]

                [{if $oxcmp_basket->isPriceViewModeNetto() }]
                    [{block name="checkout_basketcontents_totalgross"}]
                        <tr>
                            <th>[{ oxmultilang ident="TOTAL_GROSS" suffix="COLON" }]</th>
                            <td id="basketTotalGross">[{oxprice price=$oxcmp_basket->getBruttoSum() currency=$currency }]</td>
                        </tr>
                    [{/block}]
                [{/if}]
            [{/if }]

            [{block name="checkout_basketcontents_delcosts"}]
                [{assign var="deliveryCost" value=$oxcmp_basket->getDeliveryCost()}]
                [{if $deliveryCost && ($oxcmp_basket->getBasketUser() || $oViewConf->isFunctionalityEnabled('blCalculateDelCostIfNotLoggedIn') ) }]
                    [{if $oViewConf->isFunctionalityEnabled('blShowVATForDelivery') }]
                        <tr>
                            <th>[{ oxmultilang ident="SHIPPING_NET" suffix="COLON"}]</th>
                            <td id="basketDeliveryNetto">[{oxprice price=$deliveryCost->getNettoPrice() currency=$currency }]</td>
                        </tr>
                        [{if $deliveryCost->getVatValue()}]
                            <tr>
                                [{if $oxcmp_basket->isProportionalCalculationOn() }]
                                    <th>[{oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT" suffix="COLON"}]</th>
                                [{else}]
                                    <th>[{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$deliveryCost->getVat()}]</th>
                                [{/if}]
                                <td id="basketDeliveryVat">[{oxprice price=$deliveryCost->getVatValue() currency=$currency}]</td>
                            </tr>
                        [{/if}]
                    [{else}]
                        <tr>
                           <th>[{ oxmultilang ident="SHIPPING_COST" suffix="COLON"}]</th>
                           <td id="basketDeliveryGross">[{oxprice price=$deliveryCost->getBruttoPrice() currency=$currency}]</td>
                        </tr>
                    [{/if}]
                [{/if}]
            [{/block}]

            [{block name="checkout_basketcontents_paymentcosts"}]
                [{assign var="paymentCost" value=$oxcmp_basket->getPaymentCost()}]
                [{if $paymentCost && $paymentCost->getPrice() }]
                    [{if $oViewConf->isFunctionalityEnabled('blShowVATForPayCharge') }]
                        <tr>
                            <th>[{if $paymentCost->getPrice() >= 0}][{ oxmultilang ident="SURCHARGE" }][{else}][{ oxmultilang ident="DEDUCTION" }][{/if}] [{ oxmultilang ident="PAYMENT_METHOD" suffix="COLON"}]</th>
                            <td id="basketPaymentNetto">>[{oxprice price=$paymentCost->getNettoPrice() currency=$currency }]</td>
                        </tr>
                    [{if $paymentCost->getVatValue()}]
                        <tr>
                            [{if $oxcmp_basket->isProportionalCalculationOn() }]
                                <th>[{ oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT" suffix="COLON" }]</th>
                            [{else}]
                                <th>[{ oxmultilang ident="SURCHARGE_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$paymentCost->getVat() }]</th>
                            [{/if}]
                            <td id="basketPaymentVat">[{oxprice price=$paymentCost->getVatValue() currency=$currency }]</td>
                        </tr>
                    [{/if}]
                    [{else}]
                        <tr>
                            <th>[{if $paymentCost->getPrice() >= 0}][{ oxmultilang ident="SURCHARGE" }][{else}][{ oxmultilang ident="DEDUCTION" }][{/if}] [{ oxmultilang ident="PAYMENT_METHOD" suffix="COLON"}]</th>
                            <td id="basketPaymentGross">[{oxprice price=$paymentCost->getBruttoPrice() currency=$currency }]</td>
                        </tr>
                    [{/if}]
                [{/if}]
            [{/block}]

            [{block name="checkout_basketcontents_ts"}]
                [{assign var="trustedShopProtectionCost" value=$oxcmp_basket->getTrustedShopProtectionCost()}]
                [{if $trustedShopProtectionCost && $trustedShopProtectionCost->getPrice() > 0 }]
                    [{if $oViewConf->isFunctionalityEnabled('blShowVATForPayCharge') }]
                        <tr>
                            <th>[{ oxmultilang ident="TRUSTED_SHOP_BUYER_PROTECTION" }]</th>
                            <td id="basketTSNetto">[{oxprice price=$trustedShopProtectionCost->getNettoPrice() currency=$currency}]</td>
                        </tr>
                        [{if $trustedShopProtectionCost->getVatValue()}]
                            <tr>
                                [{if $oxcmp_basket->isProportionalCalculationOn() }]
                                    <th>[{ oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT" suffix="COLON" }]</th>
                                [{else}]
                                    <th>[{ oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$trustedShopProtectionCost->getVat() }]</th>
                                [{/if}]
                                <td id="basketTSVat">[{oxprice price=$trustedShopProtectionCost->getVatValue() currency=$currency}]</td>
                            </tr>
                        [{/if}]
                    [{else}]
                        <tr>
                            <th>[{ oxmultilang ident="TRUSTED_SHOP_BUYER_PROTECTION" }]</th>
                            <td id="basketTSGross">[{oxprice price=$trustedShopProtectionCost->getBruttoPrice() currency=$currency}]</td>
                        </tr>
                    [{/if}]
                [{/if}]
            [{/block}]

            [{block name="checkout_basketcontents_wrappingcosts"}]
                [{if $oViewConf->getShowGiftWrapping() }]

                    [{assign var="wrappingCost" value=$oxcmp_basket->getWrappingCost()}]
                    [{if $wrappingCost && $wrappingCost->getPrice() > 0 }]
                        [{if $oViewConf->isFunctionalityEnabled('blShowVATForWrapping') }]
                            <tr>
                                <th>[{ oxmultilang ident="BASKET_TOTAL_WRAPPING_COSTS_NET" suffix="COLON" }]</th>
                                <td id="basketWrappingNetto">[{oxprice price=$wrappingCost->getNettoPrice() currency=$currency}]</td>
                            </tr>
                            [{if $oxcmp_basket->getWrappCostVat() }]
                            <tr>
                                <th>[{ oxmultilang ident="PLUS_VAT" suffix="COLON" }]</th>
                                <td id="basketWrappingVat">[{oxprice price=$wrappingCost->getVatValue() currency=$currency}]</td>
                            </tr>
                            [{/if}]
                        [{else}]
                            <tr>
                                <th>[{ oxmultilang ident="GIFT_WRAPPING" suffix="COLON" }]</th>
                                <td id="basketWrappingGross">[{oxprice price=$wrappingCost->getBruttoPrice() currency=$currency }]</td>
                            </tr>
                        [{/if}]
                    [{/if}]

                    [{assign var="giftCardCost" value=$oxcmp_basket->getGiftCardCost()}]
                    [{if $giftCardCost && $giftCardCost->getPrice() > 0 }]
                        [{if $oViewConf->isFunctionalityEnabled('blShowVATForWrapping') }]
                            <tr>
                                <th>[{ oxmultilang ident="BASKET_TOTAL_GIFTCARD_COSTS_NET" suffix="COLON" }]</th>
                                <td id="basketGiftCardNetto">[{oxprice price=$giftCardCost->getNettoPrice() currency=$currency }]</td>
                            </tr>
                            <tr>
                                [{if $oxcmp_basket->isProportionalCalculationOn() }]
                                    <th>[{ oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT" suffix="COLON" }]</th>
                                [{else}]
                                    <th>[{ oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$giftCardCost->getVat() }] </th>
                                [{/if}]
                                <td id="basketGiftCardVat">[{oxprice price=$giftCardCost->getVatValue() currency=$currency}]</td>
                            </tr>
                        [{else}]
                            <tr>
                                <th>[{ oxmultilang ident="GREETING_CARD" suffix="COLON" }]</th>
                                <td id="basketGiftCardGross">[{oxprice price=$giftCardCost->getBruttoPrice() currency=$currency}]</td>
                            </tr>
                        [{/if}]
                    [{/if}]
                [{/if}]
            [{/block}]

            [{block name="checkout_basketcontents_grandtotal"}]
                <tr class="z-basket-summary-total">
                    <th><strong>[{ oxmultilang ident="GRAND_TOTAL" suffix="COLON" }]</strong></th>
                    <td id="basketGrandTotal"><strong>[{oxprice price=$oxcmp_basket->getPrice() currency=$currency }]</strong></td>
                </tr>
            [{/block}]

            [{if $oxcmp_basket->hasSkipedDiscount() }]
                [{assign var="oMarkGenerator" value=$oView->getBasketContentMarkGenerator() }]
                <tr>
                    <td colspan="2">
                        <span id="noteWithSkippedDiscount" class="note">[{$oMarkGenerator->getMark('skippedDiscount')}]</span> [{ oxmultilang ident="MESSAGE_COUPON_NOT_APPLIED_FOR_ARTICLES" }]</span>
                    </td>
                </tr>
            [{/if}]
        </table>
        <div class="clear"></div>
    </div>
    <div class="clear"></div>
[{/block}]
