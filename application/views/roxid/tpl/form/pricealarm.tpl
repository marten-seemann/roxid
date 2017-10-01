[{assign var="currency" value=$oView->getActCurrency()}]
<p>[{ oxmultilang ident="MESSAGE_PRICE_ALARM_PRICE_CHANGE" }]</p>
<form class="form-horizontal" name="pricealarm" action="[{ $oViewConf->getSelfActionLink() }]" method="post" data-toggle="roxid-validator">
    <div>
        [{ $oViewConf->getHiddenSid() }]
        [{ $oViewConf->getNavFormParams() }]
        <input type="hidden" name="cl" value="[{$oViewConf->getTopActiveClassName()}]">
        [{if $oDetailsProduct}]
        <input type="hidden" name="anid" value="[{$oDetailsProduct->oxarticles__oxid->value}]">
        [{/if}]
        <input type="hidden" name="fnc" value="addme">
        [{assign var="oCaptcha" value=$oView->getCaptcha() }]
        <input type="hidden" name="c_mach" value="[{$oCaptcha->getHash()}]"/>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-8 col-md-6 req">[{ oxmultilang ident="YOUR_PRICE" }] ([{ $currency->sign}]):</label>
        <div class="col-sm-16 col-md-18">
            <input class="form-control" type="text" name="pa[price]" value="[{oxhasrights ident="SHOWARTICLEPRICE"}][{ if $product }][{ $product->getFPrice() }][{/if}][{/oxhasrights}]" maxlength="32" required>
            <div class="help-block with-errors"></div>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-8 col-md-6 req">[{ oxmultilang ident="EMAIL" suffix="COLON" }]</label>
        <div class="col-sm-16 col-md-18">
            <input class="form-control" type="email" name="pa[email]" value="[{ if $oxcmp_user }][{ $oxcmp_user->oxuser__oxusername->value }][{/if}]" maxlength="128" required>
            <div class="help-block with-errors"></div>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-8 col-md-6 req">
            [{block name="captcha_label"}]
                [{ oxmultilang ident="VERIFICATION_CODE" suffix="COLON" }]
            [{/block}]
        </label>
        <div class="col-sm-16 col-md-18">
            [{block name="captcha_body"}]
                <div class="row">
                    <div class="col-xs-10 col-md-7">
                        [{if $oCaptcha->isImageVisible()}]
                            <img class="verificationCode" src="[{$oCaptcha->getImageUrl()}]" alt="[{ oxmultilang ident="VERIFICATION_CODE" }]">
                        [{else}]
                            <span class="verificationCode" id="verifyTextCode">[{$oCaptcha->getText()}]</span>
                        [{/if}]
                    </div>
                    <div class="col-xs-14 col-md-17">
                        <input class="form-control required" type="text" name="c_mac" value="" required>
                    </div>
                </div>
            [{/block}]
            <div class="help-block with-errors"></div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-8 col-md-offset-6 col-sm-16 col-md-18">
            <button class="btn btn-primary" type="submit">[{ oxmultilang ident="SEND" }]</button>
        </div>
    </div>
</form>
