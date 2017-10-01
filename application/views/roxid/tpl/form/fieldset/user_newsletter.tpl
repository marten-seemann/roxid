<div class="form-group">
    <label class="control-label col-sm-8 col-xs-10" for="newsSubscribed">[{ oxmultilang ident="NEWSLETTER_SUBSCRIPTION" suffix="COLON" }]</label>
    <div class="col-sm-16 col-xs-14">
        <input type="hidden" name="blnewssubscribed" value="0">
        <input id="newsSubscribed" type="checkbox" name="blnewssubscribed" value="1" [{if $oView->isNewsSubscribed() }]checked[{/if}]>
        <span class="help-block">[{ oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION" }]</span>
    </div>
</div>
