[{assign var="_oProduct" value=$oView->getProduct()}]
[{assign var="editval" value=$oView->getInviteData()}]
<div>
    [{ $oViewConf->getHiddenSid() }]
    [{ $oViewConf->getNavFormParams() }]
    <input type="hidden" name="fnc" value="send">
    <input type="hidden" name="cl" value="invite">
    <input type="hidden" name="anid" value="[{ $_oProduct->oxarticles__oxnid->value }]">
    <input type="hidden" name="CustomError" value='invite'>
    <fieldset>
        <legend>[{ oxmultilang ident="SEND_INVITE_TO" suffix="COLON" }]</legend>
        <div class="form-group">
            <label class="control-label col-lg-5 col-sm-6 req">[{ oxmultilang ident="EMAIL" }] #1:</label>
            <div class="col-lg-16 col-sm-18">
                <input type="email" class="form-control" name="editval[rec_email][1]" maxlength="73" value="[{$editval->rec_email.1}]" required>
                <div class="help-block with-errors"></div>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-5 col-sm-6">[{ oxmultilang ident="EMAIL" }] #2:</label>
            <div class="col-lg-16 col-sm-18">
                <input type="email" name="editval[rec_email][2]" maxlength="73" value="[{$editval->rec_email.2}]" class="form-control">
                <div class="help-block with-errors"></div>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-5 col-sm-6">[{ oxmultilang ident="EMAIL" }] #2:</label>
            <div class="col-lg-16 col-sm-18">
                <input type="email" name="editval[rec_email][2]" maxlength="73" value="[{$editval->rec_email.2}]" class="form-control">
                <div class="help-block with-errors"></div>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-5 col-sm-6">[{ oxmultilang ident="EMAIL" }] #3:</label>
            <div class="col-lg-16 col-sm-18">
                <input type="email" name="editval[rec_email][3]" maxlength="73" value="[{$editval->rec_email.3}]" class="form-control">
                <div class="help-block with-errors"></div>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-5 col-sm-6">[{ oxmultilang ident="EMAIL" }] #4:</label>
            <div class="col-lg-16 col-sm-18">
                <input type="email" name="editval[rec_email][4]" maxlength="73" value="[{$editval->rec_email.4}]" class="form-control">
                <div class="help-block with-errors"></div>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-5 col-sm-6">[{ oxmultilang ident="EMAIL" }] #5:</label>
            <div class="col-lg-16 col-sm-18">
                <input type="email" name="editval[rec_email][5]" maxlength="73" value="[{$editval->rec_email.5}]" class="form-control">
                <div class="help-block with-errors"></div>
            </div>
        </div>
    </fieldset>

    <fieldset>
        <legend>[{ oxmultilang ident="FROM" suffix="COLON"}]</legend>
        <div class="form-group">
            <label class="control-label col-lg-5 col-sm-6 req">[{ oxmultilang ident="SENDER_NAME" suffix="COLON" }]</label>
            <div class="col-lg-16 col-sm-18">
                <input type="text" class="form-control" name="editval[send_name]" maxlength="73" value="[{$editval->send_name}]" required>
                <div class="help-block with-errors"></div>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-5 col-sm-6 req">[{ oxmultilang ident="SENDER_EMAIL" suffix="COLON" }]</label>
            <div class="col-lg-16 col-sm-18">
                <input type="email" class="form-control" name="editval[send_email]" maxlength="73" value="[{$editval->send_email}]" required>
                <div class="help-block with-errors"></div>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-5 col-sm-6 req">[{ oxmultilang ident="SUBJECT" suffix="COLON"}]</label>
            <div class="col-lg-16 col-sm-18">
                <input type="text" class="form-control" name="editval[send_subject]" maxlength="73" value="[{if $editval->send_subject}][{$editval->send_subject}][{else}][{ oxmultilang ident="HAVE_A_LOOK" suffix="COLON" }] [{ $_oProduct->oxarticles__oxtitle->value|strip_tags }][{/if}]" required>
                <div class="help-block with-errors"></div>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-5 col-sm-6 req">[{ oxmultilang ident="MESSAGE" suffix="COLON" }]</label>
            <div class="col-lg-16 col-sm-18">
                <textarea rows="8" name="editval[send_message]" class="form-control" required>[{if $editval->send_message}][{$editval->send_message}][{else}][{ oxmultilang ident="SHOP_SUGGEST_MESSAGE" args=$oxcmp_shop->oxshops__oxname->value}][{/if}]</textarea>
                <div class="help-block with-errors"></div>
            </div>
        </div>
        
        [{block name="captcha_form"}][{/block}]

    </fieldset>
</div>
