[{if $oView->getWishList() }]
    <form class="form-horizontal" name="wishlist_wishlist_status" action="[{ $oViewConf->getSelfActionLink() }]" method="post">
        [{ $oViewConf->getHiddenSid() }]
        <input type="hidden" name="fnc" value="togglepublic">
        <input type="hidden" name="cl" value="account_wishlist">
        <fieldset>
            <legend>[{ oxmultilang ident="PUBLISH" }]</legend>
            <div class="form-group">
                <label class="control-label col-xs-16 col-sm-18 col-lg-16">[{ oxmultilang ident="MESSAGE_MAKE_GIFT_REGISTRY_PUBLISH" suffix="COLON" }]</label>
                <div class="col-xs-8 col-sm-6 col-lg-8">
                    [{assign var="wishlist" value=$oView->getWishList() }]
                    <label for="" class="radio-inline">
                        <input type="radio" name="blpublic" value="1" [{if $wishlist->oxuserbaskets__oxpublic->value}]checked[{/if }]>[{ oxmultilang ident="YES" }]
                    </label>
                    <div class="radio-inline">
                        <input type="radio" name="blpublic" value="0" [{if !$wishlist->oxuserbaskets__oxpublic->value}]checked[{/if }]> [{ oxmultilang ident="NO" }]
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-xs-24">
                    <button class="btn btn-primary" type="submit">[{$oViewConf->getRoxidIcon('save')}] [{ oxmultilang ident="SAVE" }]</button><br>
                    [{if !$oView->showSuggest()}]
                        <a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_wishlist" params="blshowsuggest=1" }]">
                            [{ oxmultilang ident="MESSAGE_SEND_GIFT_REGISTRY" }]
                        </a>
                    [{/if}]
                </div>
            </div>
        </fieldset>
    </form>
[{/if}]
