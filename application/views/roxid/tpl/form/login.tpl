<form name="login" id="loginform" action="[{ $oViewConf->getSslSelfLink() }]" method="post" data-toggle="roxid-validator">
    [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
    [{ $oViewConf->getHiddenSid() }]
    [{ $oViewConf->getNavFormParams() }]
    <input type="hidden" name="fnc" value="login_noredirect">
    <input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
    <div class="form-group [{if $aErrors}]has-error[{/if}]">
        <label class="control-label">[{ oxmultilang ident="EMAIL_ADDRESS" }]</label>
        <input type="email" name="lgn_usr" class="form-control" required>
        <div class="help-block with-errors"></div>
    </div>
    <div class="form-group [{if $aErrors}]has-error[{/if}]">
        <label class="control-label">[{ oxmultilang ident="PASSWORD" }]</label>
        <input type="password" name="lgn_pwd" class="form-control" required>
        <div class="help-block with-errors"></div>
        <div>
            <a href="#" data-toggle="modal" data-target="#forgot-pwd-modal">[{ oxmultilang ident="FORGOT_PASSWORD" }]</a>
        </div>
    </div>
    [{if !$noSubmit}]
        <div class="form-group">
            <button type="submit" class="btn btn-primary">[{$oViewConf->getRoxidIcon('login')}] [{ oxmultilang ident="LOGIN" }]</button>
        </div>
    [{/if}]
</form>
