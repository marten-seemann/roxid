[{assign var="_oProduct" value=$oView->getProduct()}]
[{assign var="editval" value=$oView->getSuggestData()}]
<form class="form-horizontal" action="[{ $oViewConf->getSslSelfLink() }]" method="post" data-toggle="roxid-validator">
    <div>
        [{ $oViewConf->getHiddenSid() }]
        [{ $oViewConf->getNavFormParams() }]
        <input type="hidden" name="fnc" value="send">
        <input type="hidden" name="cl" value="suggest">
        <input type="hidden" name="anid" value="[{ $_oProduct->oxarticles__oxnid->value }]">
        <input type="hidden" name="CustomError" value='suggest'>
        [{assign var="oCaptcha" value=$oView->getCaptcha() }]
        <input type="hidden" name="c_mach" value="[{$oCaptcha->getHash()}]">
        <fieldset>
            <legend>[{ oxmultilang ident="CARD_TO" }]</legend>
            <div class="form-group">
                <label class="control-label col-sm-6 req">[{ oxmultilang ident="RECIPIENT_NAME" suffix="COLON" }]</label>
                <div class="col-sm-18">
                    <input class="form-control" type="text" name="editval[rec_name]" maxlength="73" value="[{$editval->rec_name}]" required>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-6 req">[{ oxmultilang ident="RECIPIENT_EMAIL" suffix="COLON" }]</label>
                <div class="col-sm-18">
                    <input class="form-control" type="email" name="editval[rec_email]" maxlength="73" value="[{$editval->rec_email}]" required>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
        </fieldset>

        <fieldset>
            <legend>[{ oxmultilang ident="FROM" suffix="COLON" }]</legend>
            <div class="form-group">
                <label class="control-label col-sm-6 req">[{ oxmultilang ident="SENDER_NAME" suffix="COLON"}]</label>
                <div class="col-sm-18">
                    <input class="form-control" type="text" name="editval[send_name]" maxlength="73" value="[{$editval->send_name}]" required>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-6 req">[{ oxmultilang ident="SENDER_EMAIL" suffix="COLON" }]</label>
                <div class="col-sm-18">
                    <input class="form-control" type="email" name="editval[send_email]" maxlength="73" value="[{$editval->send_email}]" required>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-6 req">[{ oxmultilang ident="SUBJECT" suffix="COLON"}]</label>
                <div class="col-sm-18">
                    <input class="form-control" type="text" name="editval[send_subject]" maxlength="73" value="[{if $editval->send_subject}][{$editval->send_subject}][{else}][{ oxmultilang ident="HAVE_A_LOOK" suffix="COLON" }] [{ $_oProduct->oxarticles__oxtitle->value|strip_tags }][{/if}]" required>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-6 req">[{ oxmultilang ident="MESSAGE" suffix="COLON" }]</label>
                <div class="col-sm-18">
                    <textarea cols="70" rows="8" name="editval[send_message]" class="form-control" required>[{if $editval->send_message}][{$editval->send_message}][{else}][{ oxmultilang ident="SHOP_SUGGEST_MESSAGE" args=$oxcmp_shop->oxshops__oxname->value}] [{/if}]</textarea>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-6 req">
                    [{block name="captcha_label"}]
                        [{ oxmultilang ident="VERIFICATION_CODE" suffix="COLON" }]
                    [{/block}]
                </label>
                <div class="col-sm-18">
                    [{block name="captcha_body"}]
                        <div class="row">
                            <div class="col-xs-7">
                                [{assign var="oCaptcha" value=$oView->getCaptcha() }]
                                [{if $oCaptcha->isImageVisible()}]
                                    <img src="[{$oCaptcha->getImageUrl()}]" alt="">
                                [{else}]
                                    <span class="verificationCode" id="verifyTextCode">[{$oCaptcha->getText()}]</span>
                                [{/if}]
                            </div>
                            <div class="col-xs-17">
                                <input type="text" class="form-control" name="c_mac" value="" required>
                            </div>
                        </div>
                    [{/block}]
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-18">
                    <button class="btn btn-primary" type="submit">[{$oViewConf->getRoxidIcon('product_recommend')}] [{ oxmultilang ident="SEND" }]</button>
                </div>
            </div>
        </fieldset>
    </div>
</form>
