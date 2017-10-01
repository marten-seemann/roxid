[{capture append="oxidBlock_content"}]
    [{assign var="editval" value=$oView->getEnteredData() }]

    <div class="page-header">
        <h1>[{ $oView->getTitle() }]</h1>
    </div>

    [{if $oView->isWishListEmailSent() }]
        [{assign var="_statusMessage" value="GIFT_REGISTRY_SENT_SUCCESSFULLY"|oxmultilangassign:$editval->rec_email}]
        [{include file="message/notice.tpl" statusMessage=$_statusMessage|cat:$_statusMessageSuffix}]
    [{/if }]

    [{if !$oView->getWishListUsers() && $oView->getWishListSearchParam() }]
        [{assign var="_statusMessage" value="MESSAGE_SORRY_NO_GIFT_REGISTRY"|oxmultilangassign}]
        [{include file="message/error.tpl" statusMessage=$_statusMessage}]
    [{/if }]

    <div class="wishlistView row">
        <div class="col-xs-24">
            [{include file="form/wishlist_search.tpl" searchClass="account_wishlist"}]
        </div>
    </div>

    [{if $oView->getWishList() }]
        <div class="row">
            <div class="col-lg-10 wishlistPublish clear">
                [{include file="form/wishlist_publish.tpl"}]
            </div>
            <div class="wishlistSuggest col-lg-14">
                [{include file="form/wishlist_suggest.tpl"}]
            </div>
        </div>
    [{/if}]

    <hr>
    [{if $oView->getWishList() }]
        [{include file="widget/product/list.tpl" type="line" listId="wishlistProductList" title="" products=$oView->getWishProductList() removeFunction="towishlist" toBasketFunction="tobasket" owishid=$oxcmp_user->oxuser__oxid->value}]
    [{else }]
        [{ oxmultilang ident="GIFT_REGISTRY_EMPTY" }]
    [{/if }]
[{/capture}]
[{capture append="oxidBlock_sidebar"}]
    [{include file="page/account/inc/account_menu.tpl" active_link="wishlist"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]
