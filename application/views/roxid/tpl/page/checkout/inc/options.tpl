[{block name="checkout_user_options"}]
    [{if $oView->getShowNoRegOption() }]
        [{assign var="spansize" value="8"}]
    [{else}]
        [{assign var="spansize" value="12"}]
    [{/if}]

    <div class="z-checkout-options row">
        [{block name="checkout_options_noreg"}]
            [{if $oView->getShowNoRegOption() }]
            <div class="col-sm-[{$spansize}]" id="optionNoRegistration">
                <form action="[{ $oViewConf->getSslSelfLink() }]" method="post">
                    <fieldset>
                        <legend>[{ oxmultilang ident="PURCHASE_WITHOUT_REGISTRATION" }]</legend>
                        [{block name="checkout_options_noreg_text"}]
                            <p>[{ oxmultilang ident="DO_NOT_WANT_CREATE_ACCOUNT" }]</p>
                            [{if $oView->isDownloadableProductWarning() }]
                                <p>[{ oxmultilang ident="MESSAGE_DOWNLOADABLE_PRODUCT" }]</p>
                            [{/if}]
                        [{/block}]
                        [{ $oViewConf->getHiddenSid() }]
                        [{ $oViewConf->getNavFormParams() }]
                        <input type="hidden" name="cl" value="user">
                        <input type="hidden" name="fnc" value="">
                        <input type="hidden" name="option" value="1">
                        <button class="btn btn-primary" type="submit">[{ oxmultilang ident="NEXT" }] [{$oViewConf->getRoxidIcon('step_next')}]</button>
                    </fieldset>
                </form>
            </div>
            [{/if}]
        [{/block}]

        [{block name="checkout_options_reg"}]
            <div class="col-sm-[{$spansize}] z-checkout-option-registration" id="optionRegistration">
                <form action="[{ $oViewConf->getSslSelfLink() }]" method="post">
                    <fieldset>
                        <legend>[{ oxmultilang ident="OPEN_ACCOUNT" }]</legend>
                        [{block name="checkout_options_reg_text"}]
                            [{oxifcontent ident="oxregistrationdescription" object="oCont"}]
                                [{$oCont->oxcontents__oxcontent->value}]
                            [{/oxifcontent}]
                        [{/block}]
                        [{ $oViewConf->getHiddenSid() }]
                        [{ $oViewConf->getNavFormParams() }]
                        <input type="hidden" name="cl" value="user">
                        <input type="hidden" name="fnc" value="">
                        <input type="hidden" name="option" value="3">
                        <button class="btn btn-primary" type="submit">[{ oxmultilang ident="NEXT" }] [{$oViewConf->getRoxidIcon('step_next')}]</button>
                </fieldset>
                </form>
            </div>
        [{/block}]

        [{block name="checkout_options_login"}]
            <div class="col-sm-[{$spansize}] z-checkout-option-login" id="optionLogin">
                <!-- <form action="#"> -->
                    <fieldset>
                        <legend>[{ oxmultilang ident="ALREADY_CUSTOMER" }]</legend>
                        [{block name="checkout_options_login_text"}]
                            <p>[{ oxmultilang ident="LOGIN_DESCRIPTION" }]</p>
                        [{/block}]
                        [{ include file="form/login.tpl"}]
                    </fieldset>
                <!-- </form> -->
            </div>
        [{/block}]
    </div>
[{/block}]
