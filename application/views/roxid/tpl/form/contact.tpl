[{assign var="editval" value=$oView->getUserData() }]

<form class="form-horizontal" action="[{ $oViewConf->getSslSelfLink() }]" method="post" data-toggle="roxid-validator">
    <div>
        [{ $oViewConf->getHiddenSid() }]
        <input type="hidden" name="fnc" value="send"/>
        <input type="hidden" name="cl" value="contact"/>
    </div>
    [{block name="contact_form_fields"}]
        <div class="form-group">
            <label class="control-label col-xs-6 radio">[{ oxmultilang ident="TITLE" suffix="COLON" }]</label>
            <div class="col-xs-18">
                [{if $oxcmp_user && !$editval.oxuser__oxsal}]
                    [{include file="form/fieldset/salutation.tpl" name="editval[oxuser__oxsal]" value=$oxcmp_user->oxuser__oxsal->value required=false}]
                [{else}]
                    [{include file="form/fieldset/salutation.tpl" name="editval[oxuser__oxsal]" value=$editval.oxuser__oxsal required=false}]
                [{/if}]
            </div>
        </div>
        <div class="form-group [{if $aErrors.oxuser__oxfname}]has-error[{/if}]>">
            <label class="control-label col-sm-6 req">[{ oxmultilang ident="FIRST_NAME" suffix="COLON" }]</label>
            <div class="col-sm-18">
                <input type="text" name="editval[oxuser__oxfname]" class="form-control" maxlength="60" value="[{if $oxcmp_user && !$editval.oxuser__oxfname}][{$oxcmp_user->oxuser__oxfname->value}][{else}][{$editval.oxuser__oxfname}][{/if}]" required>
                <div class="help-block with-errors"></div>
            </div>
        </div>
        <div class="form-group [{if $aErrors.oxuser__oxlname}]has-error[{/if}]">
            <label class="control-label col-sm-6 req">[{ oxmultilang ident="LAST_NAME" }]</label>
            <div class="col-sm-18">
                <input type="text" name="editval[oxuser__oxlname]" class="form-control" maxlength="60" value="[{if $oxcmp_user && !$editval.oxuser__oxlname}][{$oxcmp_user->oxuser__oxlname->value}][{else}][{$editval.oxuser__oxlname}][{/if}]" required>
                <div class="help-block with-errors"></div>
            </div>
        </div>
        <div class="form-group [{if $aErrors.oxuser__oxusername}]has-error[{/if}]">
            <label class="control-label col-sm-6 req">[{ oxmultilang ident="EMAIL" suffix="COLON" }]</label>
            <div class="col-sm-18">
                <input id="contactEmail" type="email" name="editval[oxuser__oxusername]" class="form-control" maxlength="60" value="[{$editval.oxuser__oxusername}]" required>
                <div class="help-block with-errors"></div>
            </div>
        </div>
        <div class="form-group  [{if $aErrors && !$oView->getContactSubject()}]has-error[{/if}]">
            <label class="control-label col-sm-6 req">[{ oxmultilang ident="SUBJECT" suffix="COLON" }]</label>
            <div class="col-sm-18">
                <input type="text" name="c_subject" class="form-control" maxlength="80" value="[{$oView->getContactSubject()}]" required>
                <div class="help-block with-errors"></div>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-6 req">[{ oxmultilang ident="MESSAGE" suffix="COLON" }]</label>
            <div class="col-sm-18">
                <textarea rows="10" name="c_message" class="form-control" required>[{$oView->getContactMessage()}]</textarea>
                <div class="help-block with-errors"></div>
            </div>
        </div>
    [{/block}]
    
    [{block name="captcha_form"}][{/block}]

    <div class="form-group">
        <div class="col-sm-offset-6 col-sm-18">
            <button class="btn btn-primary" type="submit">[{ oxmultilang ident="SEND" }]</button>
        </div>
    </div>
</form>
