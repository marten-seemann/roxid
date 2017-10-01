[{oxscript add="$('.oxValidate_enterPass').oxEnterPassword();"}]
<div class="form-group [{if $aErrors.oxuser__oxusername}]has-error[{/if}]">
    <label class="control-label col-sm-8 req">[{ oxmultilang ident="EMAIL_ADDRESS" suffix="COLON" }]</label>
    <div class="col-sm-16">
        <input class="form-control" type="email" name="invadr[oxuser__oxusername]" value="[{if isset( $invadr.oxuser__oxusername ) }][{ $invadr.oxuser__oxusername }][{else }][{ $oxcmp_user->oxuser__oxusername->value }][{/if }]" required>
        <div class="help-block with-errors"></div>
    </div>
</div>
<div class="form-group [{if $aErrors.oxuser__oxpassword}]has-error[{/if}]" [{if !$aErrors.oxuser__oxpassword}]style="display:none;"[{/if}]>
    <label class="control-label col-sm-8 req">[{oxmultilang ident="PASSWORD" suffix="COLON" }]</label>
    <div class="col-sm-16">
        <input class="form-control" type="password" name="user_password" required>
        <div class="help-block with-errors"></div>
        [{if $aErrors.oxuser__oxpassword}]
            <div class="help-block">[{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxpassword}]</div>
        [{/if}]
    </div>
</div>
