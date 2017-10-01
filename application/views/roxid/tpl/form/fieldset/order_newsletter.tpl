[{if $blSubscribeNews}]
    <div class="form-group">
        [{block name="user_billing_newsletter"}]
            <label class="control-label col-lg-10 col-md-12 col-sm-8 col-xs-14" for="subscribeNewsletter">
                [{ oxmultilang ident="NEWSLETTER_SUBSCRIPTION" suffix="COLON" }]
            </label>
            <div class="col-lg-14 col-md-12 col-sm-16 col-xs-10">
                <input type="hidden" name="blnewssubscribed" value="0">
                <input id="subscribeNewsletter" type="checkbox" name="blnewssubscribed" value="1" [{if $oView->isNewsSubscribed()}]checked[{/if}]>
                <span class="help-block">[{ oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION" }]</span>
            </div>
        [{/block}]
    </div>
[{/if}]
