<div class="z-wishlist-search">
    <form class="form-horizontal" name="wishlist_searchbox" action="[{ $oViewConf->getSelfActionLink() }]" method="post">
        [{ $oViewConf->getHiddenSid() }]
        <input type="hidden" name="cl" value="[{$searchClass}]">
        <input type="hidden" name="fnc" value="searchforwishlist">
        <fieldset>
            <legend>[{ oxmultilang ident="SEARCH_GIFT_REGISTRY" }]</legend>
            <div class="form-group">
                <label class="control-label col-sm-12 col-md-10 col-lg-8">[{ oxmultilang ident="ENTER_EMAIL_OR_NAME" suffix="COLON"}]&nbsp;</label>
                <div class="col-sm-12 col-md-14 col-lg-16">
                    <div class="input-group">
                        <input type="search" class="form-control" name="search" value="[{ $oView->getWishListSearchParam() }]" size="30">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="submit">[{ oxmultilang ident="FORM_WISHLIST_SEARCH_SEARCH" }]</button>
                        </span>
                    </div>
                </div>
            </div>
        </fieldset>
    </form>
    <div>
    [{if $oView->getWishListUsers() }]
        <dl>
            <dt>[{ oxmultilang ident="GIFT_REGISTRY_SEARCH_RESULTS" suffix="COLON" }]</dt>
            [{foreach from=$oView->getWishListUsers() item=wishres }]
                <dd>
                <a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=wishlist" params="wishid=`$wishres->oxuser__oxid->value`" }]">
                    [{ oxmultilang ident="GIFT_REGISTRY_OF" }] [{ $wishres->oxuser__oxfname->value }]&nbsp;[{ $wishres->oxuser__oxlname->value }]
                </a>
                </dd>
            [{/foreach }]
        </dl>
    [{/if }]
    </div>
</div>
