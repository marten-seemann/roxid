<dl>
    <dt>
        <label class="radio" for="payment_[{$sPaymentID}]"><input id="payment_[{$sPaymentID}]" type="radio" name="paymentid" value="[{$sPaymentID}]" [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]checked[{/if}]> [{ $paymentmethod->oxpayments__oxdesc->value}]
            [{if $paymentmethod->getPrice()}]
                [{assign var="oPaymentPrice" value=$paymentmethod->getPrice() }]
                [{if $oViewConf->isFunctionalityEnabled('blShowVATForPayCharge') }]
                    ([{oxprice price=$oPaymentPrice->getNettoPrice() currency=$currency}]
                    [{if $oPaymentPrice->getVatValue() > 0}][{ oxmultilang ident="PLUS_VAT" }] [{oxprice price=$oPaymentPrice->getVatValue() currency=$currency }][{/if}])
                [{else}]
                    ([{oxprice price=$oPaymentPrice->getBruttoPrice() currency=$currency}])
                [{/if}]
            [{/if}]
        </label>
    </dt>
    <dd class="[{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]activePayment[{/if}]">
        [{block name="checkout_payment_longdesc"}]
            [{if $paymentmethod->oxpayments__oxlongdesc->value|trim}]
                <div class="desc">
                    [{ $paymentmethod->oxpayments__oxlongdesc->getRawValue()}]
                </div>
            [{/if}]
        [{/block}]
    </dd>
</dl>
