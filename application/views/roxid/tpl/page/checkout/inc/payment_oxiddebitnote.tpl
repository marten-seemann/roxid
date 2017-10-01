[{assign var="dynvalue" value=$oView->getDynValue()}]
[{assign var="iPayError" value=$oView->getPaymentError() }]
<dl>
    <dt>
        <label class="radio" for="payment_[{$sPaymentID}]">
            <input id="payment_[{$sPaymentID}]" type="radio" name="paymentid" value="[{$sPaymentID}]" [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]checked[{/if}]> [{ $paymentmethod->oxpayments__oxdesc->value}]
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
        <div class="form-group">
            <label class="control-label col-sm-6 req">[{ oxmultilang ident="BANK_ACCOUNT_HOLDER" suffix="COLON" }]</label>
            <div class="col-sm-18">
                <input type="text" class="form-control" maxlength="64" name="dynvalue[lsktoinhaber]" value="[{ if $dynvalue.lsktoinhaber }][{ $dynvalue.lsktoinhaber }][{else}][{$oxcmp_user->oxuser__oxfname->value}] [{$oxcmp_user->oxuser__oxlname->value}][{/if}]" required>
                <div class="help-block with-errors"></div>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-6 req">[{ oxmultilang ident="BANK" suffix="COLON" }]</label>
            <div class="col-sm-18">
                <input id="payment_[{$sPaymentID}]_1" class="form-control" type="text"  maxlength="64" name="dynvalue[lsbankname]" value="[{ $dynvalue.lsbankname }]" autocomplete="off" required>
                <div class="help-block with-errors"></div>
            </div>
        </div>
        <div class="form-group [{if $iPayError == -4}]has-error[{/if}]">
            <label class="control-label col-sm-6 req">
                [{if $oView->isOldDebitValidationEnabled()}]
                    [{ oxmultilang ident="BANK_CODE" suffix="COLON" }]
                [{else}]
                    [{ oxmultilang ident="BIC" suffix="COLON" }]
                [{/if}]
            </label>
            <div class="col-sm-18">
                <input type="text" class="form-control" maxlength="64" name="dynvalue[lsblz]" value="[{ $dynvalue.lsblz }]" autocomplete="off" required>
                <div class="help-block with-errors"></div>
            </div>
        </div>
        <div class="form-group [{if $iPayError == -5}]has-error[{/if}]">
            <label class="control-label col-sm-6 req">
                [{if $oView->isOldDebitValidationEnabled()}]
                    [{ oxmultilang ident="BANK_ACCOUNT_NUMBER" suffix="COLON" }]
                [{else}]
                    [{ oxmultilang ident="IBAN" suffix="COLON" }]
                [{/if}]
            </label>
            <div class="col-sm-18">
                <input type="text" class="form-control" maxlength="64" name="dynvalue[lsktonr]" value="[{ $dynvalue.lsktonr }]" autocomplete="off" required>
                <div class="help-block with-errors"></div>
            </div>
        </div>

        [{block name="checkout_payment_longdesc"}]
            [{if $paymentmethod->oxpayments__oxlongdesc->value}]
                <p class="help-block">[{ $paymentmethod->oxpayments__oxlongdesc->getRawValue()}]</p>
            [{/if}]
        [{/block}]
    </dd>
</dl>
