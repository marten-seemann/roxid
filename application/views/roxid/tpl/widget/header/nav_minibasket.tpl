<li class="z-navbar-minibasket [{if $minibasketDisplay=="small"}]z-navbar-minibasket-iconlarge[{/if}]">
  <a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket" }]" rel="nofollow">
    <div class="z-navbar-icon">
      [{$oViewConf->getRoxidIcon('basket')}]
      [{assign var="item_count" value=$oxcmp_basket->getItemsCount()}]
      <div class="z-basket-itemcounter" [{if $item_count == 0 }]style="display:none;"[{/if}]>
        (<span class="z-basket-itemcount">[{$item_count}]</span>)
      </div>
    </div>
  </a>
</li>
