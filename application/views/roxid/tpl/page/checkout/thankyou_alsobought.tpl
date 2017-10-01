[{if $oView->getAlsoBoughtTheseProducts()}]
    <hr>
    <h3>[{ oxmultilang ident="WHO_BOUGHT_ALSO_BOUGHT" suffix="COLON" }]</h3>
    [{include file="widget/product/list.tpl" type=$oView->getListDisplayType() listId="alsoBoughtThankyou" products=$oView->getAlsoBoughtTheseProducts() blDisableToCart=true}]
[{/if}]
