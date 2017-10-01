[{capture append="oxidBlock_content"}]
    <div class="page-header">
        <h1>[{ $oView->getTitle() }]</h1>
    </div>

    [{assign var=oOrders value=$oView->getOrderList() }]

    [{block name="account_order_history"}]
        [{if count($oOrders) > 0 }]
            [{assign var=oArticleList value=$oView->getOrderArticleList() }]
            <div class="z-order-list">
                [{foreach from=$oOrders item=order }]
                    <div class="z-order-listitem panel panel-default">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-md-14">
                                    <div class="z-order-date">
                                        [{ oxmultilang ident="ORDER_DATE" suffix="COLON" }] <strong id="accOrderDate_[{$order->oxorder__oxordernr->value}]">[{ $order->oxorder__oxorderdate->value|date_format:"%d.%m.%Y" }]</strong>,
                                        <span>[{ $order->oxorder__oxorderdate->value|date_format:"%H:%M" }]</span>
                                    </div>
                                    <div>
                                        <strong>[{ oxmultilang ident="ORDER_NUMBER" suffix="COLON" }]</strong>
                                        <span id="accOrderNo_[{$order->oxorder__oxordernr->value}]">[{ $order->oxorder__oxordernr->value }]</span>
                                        [{if $order->getShipmentTrackingUrl()}]
                                            <strong>[{ oxmultilang ident="TRACKING_ID" suffix="COLON" }]</strong>
                                            <span id="accOrderTrack_[{$order->oxorder__oxordernr->value}]">
                                                <a href="[{$order->getShipmentTrackingUrl()}]">[{ oxmultilang ident="TRACK_SHIPMENT" }]</a>
                                            </span>
                                        [{/if }]
                                    </div>
                                </div>
                                <div class="col-md-10">
                                    <div>
                                        <strong>[{ oxmultilang ident="STATUS" suffix="COLON" }]</strong>
                                        <span id="accOrderStatus_[{$order->oxorder__oxordernr->value}]">
                                            [{if $order->oxorder__oxstorno->value}]
                                                <span class="note">[{ oxmultilang ident="ORDER_IS_CANCELED" }]</span>
                                            [{elseif $order->oxorder__oxsenddate->value !="-" }]
                                                <span>[{ oxmultilang ident="SHIPPED" }]</span>
                                            [{else }]
                                                <span class="note">[{ oxmultilang ident="NOT_SHIPPED_YET" }]</span>
                                            [{/if }]
                                        </span>
                                    </div>
                                    <div>
                                        <strong>[{ oxmultilang ident="SHIPMENT_TO" suffix="COLON" }]</strong>
                                        <span id="accOrderName_[{$order->oxorder__oxordernr->value}]">
                                        [{if $order->oxorder__oxdellname->value }]
                                            [{ $order->oxorder__oxdelfname->value }]
                                            [{ $order->oxorder__oxdellname->value }]
                                        [{else }]
                                            [{ $order->oxorder__oxbillfname->value }]
                                            [{ $order->oxorder__oxbilllname->value }]
                                        [{/if }]
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="panel-body z-order-listitem-body">
                            [{foreach from=$order->getOrderArticles(true) item=orderitem name=testOrderItem}]
                                [{assign var=sArticleId value=$orderitem->oxorderarticles__oxartid->value }]
                                [{assign var=oArticle value=$oArticleList[$sArticleId] }]
                                <div id="accOrderAmount_[{$order->oxorder__oxordernr->value}]_[{$smarty.foreach.testOrderItem.iteration}]">
                                    <div>
                                        <span class="amount">[{ $orderitem->oxorderarticles__oxamount->value }] &times;</span>
                                        [{ if $oArticle->oxarticles__oxid->value && $oArticle->isVisible() }]
                                            <a  id="accOrderLink_[{$order->oxorder__oxordernr->value}]_[{$smarty.foreach.testOrderItem.iteration}]" href="[{ $oArticle->getLink() }]">
                                        [{/if }]
                                        [{ $orderitem->oxorderarticles__oxtitle->value }] [{ $orderitem->oxorderarticles__oxselvariant->value }][{ if $oArticle->oxarticles__oxid->value && $oArticle->isVisible() }]</a>[{/if }]
                                        [{foreach key=sVar from=$orderitem->getPersParams() item=aParam}]
                                            [{if $aParam }]
                                            <br />[{ oxmultilang ident="DETAILS" }] [{$aParam}]
                                            [{/if }]
                                        [{/foreach}]
                                    </div>
                                    <div class="small">
                                        [{* Commented due to Trusted Shops precertification. Enable if needed *}]
                                        [{*
                                        [{oxhasrights ident="TOBASKET"}]
                                        [{if $oArticle->oxarticles__oxid->value && $oArticle->isBuyable() }]
                                            <a id="accOrderToBasket_[{$order->oxorder__oxordernr->value}]_[{$smarty.foreach.testOrderItem.iteration}]" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_order" params="fnc=tobasket&amp;aid=`$oArticle->oxarticles__oxid->value`&amp;am=1" }]" rel="nofollow">[{ oxmultilang ident="TO_CART" }]</a>
                                        [{/if }]
                                        [{/oxhasrights}]
                                        *}]
                                    </div>
                                </div>
                            [{/foreach}]
                        </div>
                    </div>
                [{/foreach }]
            </div>
            [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigation() place="bottom"}]
        [{else}]
            <div class="alert alert-info">
                [{ oxmultilang ident="ORDER_EMPTY_HISTORY" }]
            </div>
        [{/if }]
    [{/block}]
[{/capture}]


[{capture append="oxidBlock_sidebar"}]
    [{include file="page/account/inc/account_menu.tpl" active_link="orderhistory"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]
