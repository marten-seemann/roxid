<form action="[{ $oViewConf->getSelfActionLink() }]" name="newsletter" class="form-horizontal" method="post">
    [{if $oView->isNewsletter() == 2}]
        <div class="alert alert-info">
            [{ oxmultilang ident="MESSAGE_SENT_CONFIRMATION_EMAIL" }]
        </div>
    [{/if}]
    <div class="form-group">
        [{ $oViewConf->getHiddenSid() }]
        [{ $oViewConf->getNavFormParams() }]
        <input type="hidden" name="fnc" value="subscribe">
        <input type="hidden" name="cl" value="account_newsletter">
        <label class="control-label col-sm-8" for="status">[{ oxmultilang ident="NEWSLETTER_SUBSCRIPTION" suffix="COLON" }]</label>
        <div class="col-sm-16">
            <label class="radio-inline">
                <input type="radio" name="status" value="1" [{if $oView->isNewsletter() }]checked="checked"[{/if }]>[{ oxmultilang ident="YES" }]
            </label>
            <label class="radio-inline">
                <input type="radio" name="status" value="0" [{if !$oView->isNewsletter() }]checked="checked"[{/if }]>[{ oxmultilang ident="NO" }]
            </label>
            <span class="help-block">[{ oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION" }]</span>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-8 col-sm-16">
            <button id="newsletterSettingsSave" type="submit" class="btn btn-primary">[{$oViewConf->getRoxidIcon('save')}] [{ oxmultilang ident="SAVE" }]</button>
        </div>
    </div>
</form>
