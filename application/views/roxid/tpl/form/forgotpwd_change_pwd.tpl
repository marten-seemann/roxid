<form class="form-horizontal" action="[{ $oViewConf->getSelfActionLink() }]" name="forgotpwd" method="post" data-toggle="roxid-validator">
    [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
    [{ $oViewConf->getHiddenSid() }]
    [{ $oViewConf->getNavFormParams() }]
    <input type="hidden" name="fnc" value="updatePassword">
    <input type="hidden" name="uid" value="[{ $oView->getUpdateId() }]">
    <input type="hidden" name="cl" value="forgotpwd">
    <input type="hidden" id="passwordLength" value="">
    <div class="form-group [{if $aErrors.oxuser__oxpassword}]has-error[{/if}]">
        <label class="control-label col-sm-7">[{ oxmultilang ident="NEW_PASSWORD" suffix="COLON" }]</label>
        <div class="col-sm-17">
            <input type="password" name="password_new" id="passwordNew" class="form-control" data-minlength="[{$oViewConf->getPasswordLength()}]" data-error="[{ oxmultilang ident="ERROR_MESSAGE_PASSWORD_TOO_SHORT" }]" required>
            <div class="help-block with-errors"></div>
        </div>
    </div>
    [{if $oViewConf->getViewThemeParam('blShowPasswordConfirm')}]
        <div class="form-group [{if $aErrors.oxuser__oxpassword}]has-error[{/if}]">
            <label class="control-label col-sm-7">[{ oxmultilang ident="CONFIRM_PASSWORD" suffix="COLON" }]</label>
            <div class="col-sm-17">
                <input type="password" name="password_new_confirm" class="form-control" data-match="#passwordNew" data-match-error="[{ oxmultilang ident="ERROR_MESSAGE_PASSWORD_DO_NOT_MATCH" }]" required>
                <div class="help-block with-errors"></div>
            </div>
        </div>
    [{/if}]
    <div class="form-group">
        <div class="col-sm-offset-7 col-sm-17">
            <button class="btn btn-primary" type="submit" name="save" value="[{ oxmultilang ident="CHANGE_PASSWORD" }]">[{$oViewConf->getRoxidIcon('save')}] [{ oxmultilang ident="CHANGE_PASSWORD" }]</button>
        </div>
    </div>
</form>
