[{oxhasrights ident="SHOWARTICLEPRICE"}]
    [{if $oDetailsProduct->getUnitPrice()}]
        <div id="productPriceUnit">[{$oDetailsProduct->getUnitQuantity()}] [{$oDetailsProduct->getUnitName()}] | [{oxprice price=$oDetailsProduct->getUnitPrice() }]/[{$oDetailsProduct->getUnitName()}] </div>
    [{/if}]
[{/oxhasrights}]
