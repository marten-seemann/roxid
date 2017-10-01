<div class="form-group [{if $aErrors.oxuser__oxusername}]has-error[{/if}]">
    [{block name="user_account_username"}]
        <label class="control-label col-sm-8 req">[{ oxmultilang ident="EMAIL_ADDRESS" suffix="COLON" }]</label>
        <div class="col-sm-16">
            <input id="userLoginName" class="form-control" type="email" name="lgn_usr" value="[{ $oView->getActiveUsername()}]" required>
            <div class="help-block with-errors"></div>
        </div>
    [{/block}]
</div>
<div class="form-group [{if $aErrors.oxuser__oxpassword}]has-error[{/if}]">
    [{block name="user_account_password"}]
        <label class="control-label col-sm-8 req">[{ oxmultilang ident="PASSWORD" suffix="COLON" }]</label>
        <div class="col-sm-16">
            <input id="userPassword" class="form-control" type="password" name="lgn_pwd" value="[{$lgn_pwd}]" data-minlength="[{$oViewConf->getPasswordLength()}]" data-error="[{ oxmultilang ident="ERROR_MESSAGE_PASSWORD_TOO_SHORT" }]" required>
            <div class="help-block with-errors"></div>
        </div>
    [{/block}]
</div>
[{if $oViewConf->getViewThemeParam('blShowPasswordConfirm')}]
    <div class="form-group [{if $aErrors.oxuser__oxpassword}]has-error[{/if}]">
        [{block name="user_account_confirmpwd"}]
            <label class="control-label col-sm-8 req">[{ oxmultilang ident="CONFIRM_PASSWORD" suffix="COLON" }]</label>
            <div class="col-sm-16">
                <input id="userPasswordConfirm" class="form-control" type="password" name="lgn_pwd2" value="[{$lgn_pwd2}]" data-match="#userPassword" data-match-error="[{ oxmultilang ident="ERROR_MESSAGE_PASSWORD_DO_NOT_MATCH" }]" required>
                <div class="help-block with-errors"></div>
            </div>
        [{/block}]
    </div>
[{/if}]

[{block name="user_account_newsletter"}]
    [{include file="form/fieldset/user_newsletter.tpl"}]
[{/block}]
