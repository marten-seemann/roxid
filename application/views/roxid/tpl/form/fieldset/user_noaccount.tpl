[{block name="user_noaccount_email"}]
    <div class="form-group [{if $aErrors.oxuser__oxusername}]has-error[{/if}]">
        <label class="control-label col-sm-8 req">[{ oxmultilang ident="EMAIL_ADDRESS" suffix="COLON" }]</label>
        <div class="col-sm-16">
            <input id="userLoginName" class="form-control" type="email" name="lgn_usr" value="[{ $oView->getActiveUsername() }]" required>
            <div class="help-block with-errors"></div>
        </div>
    </div>
[{/block}]
[{block name="user_noaccount_newsletter"}]
    [{include file="form/fieldset/user_newsletter.tpl"}]
[{/block}]
