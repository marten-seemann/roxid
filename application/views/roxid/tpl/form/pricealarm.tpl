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

    [{block name="captcha_form"}][{/block}]

    <div class="form-group">
        <div class="col-sm-offset-8 col-md-offset-6 col-sm-16 col-md-18">
            <button class="btn btn-primary" type="submit">[{ oxmultilang ident="SEND" }]</button>
        </div>
    </div>
</form>
