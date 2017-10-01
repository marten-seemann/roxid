[{if $oView->getWishList() && $oView->showSuggest() }]
    [{assign var="editval" value=$oView->getEnteredData() }]
    <form class="form-horizontal" action="[{ $oViewConf->getSelfActionLink() }]" method="post">
        [{ $oViewConf->getHiddenSid() }]
        <input type="hidden" name="fnc" value="sendwishlist">
        <input type="hidden" name="cl" value="account_wishlist">
        <input type="hidden" name="blshowsuggest" value="1">
        <input type="hidden" name="editval[send_subject]" value="[{ oxmultilang ident="GIFT_REGISTRY_OF_2" }] [{ $oxcmp_shop->oxshops__oxname->value }]">
        <input type="hidden" name="CustomError" value="account_whishlist">
        <fieldset>
            <legend>[{ oxmultilang ident="SEND_GIFT_REGISTRY" }]</legend>
            [{if count($Errors.account_whishlist)>0 }]
                <div class="alert alert-danger">
                    [{foreach from=$Errors.account_whishlist item=oEr key=key }]
                        [{ $oEr->getOxMessage()}]<br>
                    [{/foreach}]
                </div>
            [{/if}]
            <div class="form-group">
                <label class="control-label col-xs-8 col-md-6 col-lg-9 req">[{ oxmultilang ident="RECIPIENT_NAME" suffix="COLON" }]</label>
                <div class="col-xs-16 col-md-18 col-lg-15">
                    <input type="text" name="editval[rec_name]" maxlength="70" value="[{ $editval->rec_name }]" class="form-control" required>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-8 col-md-6 col-lg-9 req">[{ oxmultilang ident="RECIPIENT_EMAIL" suffix="COLON" }]</label>
                <div class="col-xs-16 col-md-18 col-lg-15">
                    <input type="email" name="editval[rec_email]" maxlength="70" value="[{ $editval->rec_email }]" class="form-control" required>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-8 col-md-6 col-lg-9 req">[{ oxmultilang ident="MESSAGE" suffix="COLON" }]</label>
                <div class="col-xs-16 col-md-18 col-lg-15">
                    <textarea rows="6" class="form-control" name="editval[send_message]" required>[{if $editval->send_message }][{ $editval->send_message }][{else }][{ oxmultilang ident="SHOP_SUGGEST_BUY_FOR_ME" args=$oxcmp_shop->oxshops__oxname->value}][{/if }]</textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="col-xs-offset-8 col-xs-16 col-md-offset-6 col-md-18 col-lg-offset-9 col-lg-15">
                    <button class="btn btn-primary" type="submit">[{$oViewConf->getRoxidIcon("product_recommend")}] [{ oxmultilang ident="SUBMIT" }]</button>
                </div>
            </div>
        </fieldset>
    </form>
[{/if }]
