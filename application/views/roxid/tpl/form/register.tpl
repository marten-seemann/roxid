<form class="form-horizontal" action="[{ $oViewConf->getSslSelfLink() }]" name="order" method="post" data-toggle="roxid-validator">
    [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
    [{ $oViewConf->getHiddenSid() }]
    [{ $oViewConf->getNavFormParams() }]
    <input type="hidden" name="fnc" value="registeruser">
    <input type="hidden" name="cl" value="register">
    <input type="hidden" name="lgn_cook" value="0">
    <input type="hidden" id="reloadAddress" name="reloadaddress" value="">
    <input type="hidden" name="option" value="3">

    <fieldset>
        <legend>[{ oxmultilang ident="ACCOUNT_INFORMATION" }]</legend>
        <div class="row">
            <div class="col-md-20 col-lg-16">
                [{ include file="form/fieldset/user_account.tpl" }]

                [{if $oView->isActive('PsLogin') }]
                    <div class="form-group">
                        <label for="orderConfirmAgbBottom" class="col-sm-8 control-label">[{ oxmultilang ident="TERMS_AND_CONDITIONS" suffix="COLON" }]</label>
                        <div class="col-sm-16">
                            <input type="hidden" name="ord_agb" value="0">
                            <input id="orderConfirmAgbBottom" type="checkbox" class="checkbox" name="ord_agb" value="1">
                            <span class="help-block">
                                [{oxifcontent ident="oxrighttocancellegend" object="oContent"}]
                                    [{ $oContent->oxcontents__oxcontent->value }]
                                [{/oxifcontent}]
                            </span>
                        </div>
                    </div>
                [{/if}]
            </div>
        </div>
    </fieldset>

    <fieldset>
        <legend>[{ oxmultilang ident="BILLING_ADDRESS" }]</legend>
        <div class="row">
            <div class="col-lg-16">
                [{ include file="form/fieldset/user_billing.tpl" noFormSubmit=true}]
            </div>
        </div>
    </fieldset>
    <div class="form-group">
        <div class="col-lg-16">
            <button id="accUserSaveTop" type="submit" name="save" class="btn btn-primary">[{$oViewConf->getRoxidIcon('save')}] [{ oxmultilang ident="FORM_FIELDSET_USER_BILLING_SAVE" }]</button>
        </div>
    </div>
</form>

[{* is this needed at all? *}]
[{*if $oView->isActive('PsLogin') }]
    <div id="popup1" class="popupBox corners FXgradGreyLight glowShadow">
         <img src="[{$oViewConf->getImageUrl('x.png')}]" alt="" class="closePop">
         [{oxifcontent ident="oxagb" object="oContent"}]
            [{ $oContent->oxcontents__oxcontent->value }]
         [{/oxifcontent}]
    </div>
    <div id="popup2" class="popupBox corners FXgradGreyLight glowShadow">
         <img src="[{$oViewConf->getImageUrl('x.png')}]" alt="" class="closePop">
         [{oxifcontent ident="oxrightofwithdrawal" object="oContent"}]
            [{ $oContent->oxcontents__oxcontent->value }]
         [{/oxifcontent}]
    </div>
[{/if*}]
