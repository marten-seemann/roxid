<div class="dropdown">
    [{if $oxcmp_user}]
        [{assign var="noticeListCount" value=$oxcmp_user->getNoticeListArtCnt()}]
        [{assign var="wishListCount" value=$oxcmp_user->getWishListArtCnt()}]
        [{assign var="recommListCount" value=$oxcmp_user->getRecommListsCount()}]
    [{else}]
        [{assign var="noticeListCount" value="0"}]
        [{assign var="wishListCount" value="0"}]
        [{assign var="recommListCount" value="0"}]
    [{/if}]
    [{math equation="a+b+c+d" a=$oView->getCompareItemsCnt() b=$noticeListCount c=$wishListCount d=$recommListCount assign=notificationsCounter}]
    [{block name="widget_header_servicebox_flyoutbox"}]
        [{*<div class="selectedValue1 [{if $notificationsCounter > 0}]hasNotifications[{/if}]">*}]
            <a href="#" rel="nofollow" class="dropdown-toggle" data-toggle="dropdown"><span>[{$oViewConf->getRoxidIcon('user')}] [{oxmultilang ident="ACCOUNT"}]</span>[{if $notificationsCounter > 0}] <span class="badge badge-info">[{$notificationsCounter}]</span> [{/if}] <i class="fa fa-caret-down"></i></a>
            <ul id="services1" class="dropdown-menu" role="menu">
                [{block name="widget_header_servicebox_items"}]
                    <!-- <li class="active"><a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" }]"><span>[{oxmultilang ident="ACCOUNT"}]</span></a></li> -->

                    <li role="menuitem"><a href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account" }]" rel="nofollow"><span>[{$oViewConf->getRoxidIcon('user')}] [{oxmultilang ident="MY_ACCOUNT"}]</span></a></li>
                    [{if $oViewConf->getShowCompareList() }]
                        <li role="menuitem"><a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=compare" }]" rel="nofollow"><span>[{$oViewConf->getRoxidIcon('product_compare')}] [{oxmultilang ident="MY_PRODUCT_COMPARISON"}]</span>[{ if $oView->getCompareItemsCnt() }] <span class="badge badge-info">[{ $oView->getCompareItemsCnt() }]</span>[{/if}]</a></li>
                        [{if $oView->getCompareItemsCnt()}]
                            [{oxscript add="$(function(){oxCompareLinks.updateLinks("|cat:$oView->getCompareItems(true)|cat:");});"}]
                        [{/if}]
                    [{/if}]
                    <li role="menuitem"><a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_noticelist" }]" rel="nofollow"><span>[{$oViewConf->getRoxidIcon('wishlist')}] [{oxmultilang ident="MY_WISH_LIST"}]</span>[{ if $oxcmp_user && $oxcmp_user->getNoticeListArtCnt()}] <span class="badge badge-info">[{ $oxcmp_user->getNoticeListArtCnt() }]</span>[{/if}]</a></li>
                    [{if $oViewConf->getShowWishlist()}]
                        <li role="menuitem"><a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_wishlist" }]" rel="nofollow"><span>[{$oViewConf->getRoxidIcon('gift_registry')}] [{oxmultilang ident="MY_GIFT_REGISTRY"}]</span>[{ if $oxcmp_user && $oxcmp_user->getWishListArtCnt()}] <span class="badge badge-info">[{ $oxcmp_user->getWishListArtCnt() }]</span>[{/if}]</a></li>
                    [{/if}]
                    [{if $oViewConf->getShowListmania()}]
                        <li role="menuitem"><a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_recommlist" }]" rel="nofollow"><span>[{$oViewConf->getRoxidIcon('listmania')}] [{oxmultilang ident="MY_LISTMANIA"}]</span>[{ if $oxcmp_user && $oxcmp_user->getRecommListsCount()}] <span class="badge badge-info">[{ $oxcmp_user->getRecommListsCount() }]</span>[{/if}]</a></li>
                    [{/if}]
                    [{if $oViewConf->isFunctionalityEnabled( "blEnableDownloads" )}]
                        <li role="menuitem"><a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_downloads" }]" rel="nofollow"><span>[{$oViewConf->getRoxidIcon('downloads')}] [{oxmultilang ident="MY_DOWNLOADS"}]</span></a></li>
                    [{/if}]
                [{/block}]
            </ul>
        [{*</div>*}]
    [{/block}]
 </div>
