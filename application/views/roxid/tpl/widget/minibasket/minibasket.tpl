[{block name="widget_minibasket"}]
    <div id="[{$_prefix}]miniBasket" class="z-basket-box">
        [{if $_prefix != "modal"}]
            <span class="z-basket-itemcounter z-basket-itemcount badge badge-info" [{if $oxcmp_basket->getItemsCount() == 0}]style="display:none;"[{/if}]>[{$oxcmp_basket->getItemsCount()}]</span>
            <a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket" }]" title="[{ oxmultilang ident="WIDGET_MINIBASKET_DISPLAY_BASKET" }]"><img src="[{$oViewConf->getImageUrl('basket@2x.png')}]" id="[{$_prefix}]minibasketIcon" alt="Basket" class="basket"></a>
        [{/if}]
    </div>
[{/block}]
[{oxstyle widget=$oView->getClassName()}]
