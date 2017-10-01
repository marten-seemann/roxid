<form class="form-horizontal" action="[{ $oViewConf->getSelfActionLink() }]" name="changepassword" method="post" data-toggle="roxid-validator">
    [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
    [{ $oViewConf->getHiddenSid() }]
    [{ $oViewConf->getNavFormParams() }]
    <input type="hidden" name="fnc" value="changePassword">
    <input type="hidden" name="cl" value="account_password">
    <input type="hidden" name="CustomError" value='user'>
    <div class="form-group [{if $aErrors.oxuser__oxpassword}]has-error[{/if}]">
        <label class="control-label col-sm-8" for="passwordOld">[{ oxmultilang ident="OLD_PASSWORD" suffix="COLON" }]</label>
        <div class="col-sm-16">
            <input type="password" id="passwordOld" class="form-control" name="password_old" required>
            <div class="help-block with-errors"></div>
        </div>
    </div>
    <div class="form-group [{if $aErrors.oxuser__oxpassword}]has-error[{/if}]">
        <label class="control-label col-sm-8" for="passwordNew">[{ oxmultilang ident="NEW_PASSWORD" suffix="COLON" }]</label>
        <div class="col-sm-16">
            <input type="password" id="passwordNew" class="form-control" name="password_new" data-minlength="[{$oViewConf->getPasswordLength()}]" data-error="[{ oxmultilang ident="ERROR_MESSAGE_PASSWORD_TOO_SHORT" }]" required>
            <div class="help-block with-errors"></div>
        </div>
    </div>
    [{if $oViewConf->getViewThemeParam('blShowPasswordConfirm')}]
        <div class="form-group [{if $aErrors.oxuser__oxpassword}]has-error[{/if}]">
            <label class="control-label col-sm-8" for="passwordNewConfirm">[{ oxmultilang ident="CONFIRM_PASSWORD" suffix="COLON" }]</label>
            <div class="col-sm-16">
                <input type="password" id="passwordNewConfirm" class="form-control" name="password_new_confirm" data-match="#passwordNew" data-match-error="[{ oxmultilang ident="ERROR_MESSAGE_PASSWORD_DO_NOT_MATCH" }]" required>
                <div class="help-block with-errors"></div>
            </div>
        </div>
    [{/if}]
    <div class="form-group">
        <div class="col-sm-offset-8 col-sm-16">
            <button id="savePass" type="submit" class="btn btn-primary">[{$oViewConf->getRoxidIcon('save')}] [{ oxmultilang ident="SAVE" }]</button>
        </div>
    </div>
</form>
