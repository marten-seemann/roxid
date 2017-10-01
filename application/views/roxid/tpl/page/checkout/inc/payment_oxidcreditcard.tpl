[{ assign var="dynvalue" value=$oView->getDynValue()}]
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
        <div class="form-group">
            <label class="control-label col-sm-6 req">[{ oxmultilang ident="CREDITCARD" suffix="COLON" }]</label>
            <div class="col-sm-18">
                <select name="dynvalue[kktype]" class="form-control" required>
                    <option value="mcd" [{if ($dynvalue.kktype == "mcd" || !$dynvalue.kktype)}]selected[{/if}]>[{ oxmultilang ident="CARD_MASTERCARD" }]</option>
                    <option value="vis" [{if $dynvalue.kktype == "vis"}]selected[{/if}]>[{ oxmultilang ident="CARD_VISA" }]</option>
                    <!--
                    <option value="amx" [{if $dynvalue.kktype == "amx"}]selected[{/if}]>American Express</option>
                    <option value="dsc" [{if $dynvalue.kktype == "dsc"}]selected[{/if}]>Discover</option>
                    <option value="dnc" [{if $dynvalue.kktype == "dnc"}]selected[{/if}]>Diners Club</option>
                    <option value="jcb" [{if $dynvalue.kktype == "jcb"}]selected[{/if}]>JCB</option>
                    <option value="swi" [{if $dynvalue.kktype == "swi"}]selected[{/if}]>Switch</option>
                    <option value="dlt" [{if $dynvalue.kktype == "dlt"}]selected[{/if}]>Delta</option>
                    <option value="enr" [{if $dynvalue.kktype == "enr"}]selected[{/if}]>EnRoute</option>
                    -->
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-6 req">[{ oxmultilang ident="NUMBER" suffix="COLON" }]</label>
            <div class="col-sm-18">
                <input type="text" class="form-control" maxlength="64" name="dynvalue[kknumber]" value="[{ $dynvalue.kknumber }]" autocomplete="off" required>
                <div class="help-block with-errors"></div>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-6 req">[{ oxmultilang ident="BANK_ACCOUNT_HOLDER" suffix="COLON" }]</label>
            <div class="col-sm-18">
                <input type="text" size="20" class="form-control" maxlength="64" name="dynvalue[kkname]" value="[{ if $dynvalue.kkname }][{ $dynvalue.kkname }][{else}][{$oxcmp_user->oxuser__oxfname->value}] [{$oxcmp_user->oxuser__oxlname->value}][{/if}]" required>
                <div class="help-block with-errors"></div>
                <span class="help-block">[{ oxmultilang ident="IF_DIFFERENT_FROM_BILLING_ADDRESS" }]</span>
            </div>
        </div>
        <div class="form-group form-inline form-inline-xs">
            <label class="control-label col-sm-6 req">[{ oxmultilang ident="VALID_UNTIL" suffix="COLON"}]</label>
            <div class="col-sm-18">
                <select name="dynvalue[kkmonth]" class="form-control input-mini" required>
                    <option [{if $dynvalue.kkmonth == "01"}]selected[{/if}]>01</option>
                    <option [{if $dynvalue.kkmonth == "02"}]selected[{/if}]>02</option>
                    <option [{if $dynvalue.kkmonth == "03"}]selected[{/if}]>03</option>
                    <option [{if $dynvalue.kkmonth == "04"}]selected[{/if}]>04</option>
                    <option [{if $dynvalue.kkmonth == "05"}]selected[{/if}]>05</option>
                    <option [{if $dynvalue.kkmonth == "06"}]selected[{/if}]>06</option>
                    <option [{if $dynvalue.kkmonth == "07"}]selected[{/if}]>07</option>
                    <option [{if $dynvalue.kkmonth == "08"}]selected[{/if}]>08</option>
                    <option [{if $dynvalue.kkmonth == "09"}]selected[{/if}]>09</option>
                    <option [{if $dynvalue.kkmonth == "10"}]selected[{/if}]>10</option>
                    <option [{if $dynvalue.kkmonth == "11"}]selected[{/if}]>11</option>
                    <option [{if $dynvalue.kkmonth == "12"}]selected[{/if}]>12</option>
                </select>

                &nbsp;/&nbsp;

                <select name="dynvalue[kkyear]" class="form-control input-small" required>
                    [{foreach from=$oView->getCreditYears() item=year}]
                        <option [{if $dynvalue.kkyear == $year}]selected[{/if}]>[{$year}]</option>
                    [{/foreach}]
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-6 req">[{ oxmultilang ident="CARD_SECURITY_CODE" suffix="COLON"}]</label>
            <div class="col-sm-18">
                <input type="text" class="form-control input-small" maxlength="64" name="dynvalue[kkpruef]" value="[{ $dynvalue.kkpruef }]" autocomplete="off" required>
                <div class="help-block with-errors"></div>
                <p class="help-block">[{ oxmultilang ident="PAGE_CHECKOUT_PAYMENT_SECURITYCODEDESCRIPTION" }]</p>
            </div>
        </div>

        [{block name="checkout_payment_longdesc"}]
            [{if $paymentmethod->oxpayments__oxlongdesc->value}]
                <p class="help-block">[{$paymentmethod->oxpayments__oxlongdesc->getRawValue()}]</p>
            [{/if}]
        [{/block}]

    </dd>
</dl>
