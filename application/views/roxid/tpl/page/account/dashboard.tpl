[{capture append="oxidBlock_content"}]
    <div class="page-header">
        [{capture name="pagetitle" assign="pagetitle"}][{ oxmultilang ident="MY_ACCOUNT" }][{/capture}]
        <h1>[{$pagetitle|replace:'-':''|trim}] <small class="hidden-inline-xs">"[{ $oxcmp_user->oxuser__oxusername->value }]"</small></h1>
    </div>


    <div id="account-dashboard" class="row">
        <div class="col-sm-12">
            [{block name="account_dashboard_col1"}]
                <dl>
                    <dt><a id="linkAccountPassword" href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_password" }]" rel="nofollow"><span class="visible-xs-inline">[{$oViewConf->getRoxidIcon('password')}]</span> [{ oxmultilang ident="CHANGE_PASSWORD" }]</a></dt>
                    <dd></dd>
                </dl>
                <dl>
                    <dt><a id="linkAccountNewsletter" href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_newsletter" }]" rel="nofollow"><span class="visible-xs-inline">[{$oViewConf->getRoxidIcon('newsletter')}]</span> [{ oxmultilang ident="NEWSLETTER_SETTINGS" }]</a></dt>
                    <dd>[{ oxmultilang ident="NEWSLETTER_SUBSCRIBE_CANCEL" }]</dd>
                </dl>
                <dl>
                    <dt><a id="linkAccountBillship" href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_user" }]" rel="nofollow"><span class="visible-xs-inline">[{$oViewConf->getRoxidIcon('addresses')}]</span> [{ oxmultilang ident="BILLING_SHIPPING_SETTINGS" }]</a></dt>
                    <dd>[{ oxmultilang ident="UPDATE_YOUR_BILLING_SHIPPING_SETTINGS" }]</dd>
                </dl>
                <dl>
                    <dt><a id="linkAccountOrder" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_order" }]" rel="nofollow"><span class="visible-xs-inline">[{$oViewConf->getRoxidIcon('orderhistory')}]</span> [{ oxmultilang ident="ORDER_HISTORY" }]</a></dt>
                    <dd>[{ oxmultilang ident="ORDERS" suffix="COLON"}] [{ $oView->getOrderCnt() }]</dd>
                </dl>
                [{if $oView->isEnabledDownloadableFiles()}]
                  <dl>
                      <dt><a id="linkAccountDownloads" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_downloads" }]" rel="nofollow"><span class="visible-xs-inline">[{$oViewConf->getRoxidIcon('downloads')}]</span> [{ oxmultilang ident="MY_DOWNLOADS" }]</a></dt>
                      <dd>[{ oxmultilang ident="MY_DOWNLOADS_DESC" }]</dd>
                  </dl>
                [{/if}]
            [{/block}]
        </div>
        <div class="col-sm-12 hidden-xs">
            [{block name="account_dashboard_col2"}]
                <dl>
                    <dt><a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_noticelist" }]" rel="nofollow">[{ oxmultilang ident="MY_WISH_LIST" }]</a></dt>
                    <dd>[{ oxmultilang ident="PRODUCT" suffix="COLON" }] [{ if $oxcmp_user }][{ $oxcmp_user->getNoticeListArtCnt() }][{else}]0[{/if}]</dd>
                </dl>
                [{if $oViewConf->getShowWishlist()}]
                    <dl>
                        <dt><a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_wishlist" }]" rel="nofollow">[{ oxmultilang ident="MY_GIFT_REGISTRY" }]</a></dt>
                        <dd>[{ oxmultilang ident="PRODUCT" suffix="COLON" }] [{ if $oxcmp_user }][{ $oxcmp_user->getWishListArtCnt() }][{else}]0[{/if}]</dd>
                    </dl>
                [{/if}]
                [{if $oViewConf->getShowCompareList()}]
                    <dl>
                        <dt><a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=compare" }]" rel="nofollow">[{ oxmultilang ident="MY_PRODUCT_COMPARISON" }]</a></dt>
                        <dd>[{ oxmultilang ident="PRODUCT" suffix="COLON" }] [{ if $oView->getCompareItemsCnt() }][{ $oView->getCompareItemsCnt() }][{else}]0[{/if}]</dd>
                    </dl>
                [{/if}]
                [{if $oViewConf->getShowListmania()}]
                    <dl>
                        <dt><a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_recommlist" }]">[{ oxmultilang ident="MY_LISTMANIA" }]</a></dt>
                        <dd>[{ oxmultilang ident="LISTS" suffix="COLON" }] [{ if $oxcmp_user->getRecommListsCount() }][{ $oxcmp_user->getRecommListsCount() }][{else}]0[{/if}]</dd>
                    </dl>
                [{/if}]
            [{/block}]
        </div>
    </div>

    <div class="visible-xs-inline">
        <a href="[{ $oViewConf->getLogoutLink() }]" class="btn btn-default">[{$oViewConf->getRoxidIcon('logout')}] [{ oxmultilang ident="LOGOUT" }]</a>
    </div>
[{/capture}]


[{capture append="oxidBlock_sidebar"}]
    [{include file="page/account/inc/account_menu.tpl"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]
