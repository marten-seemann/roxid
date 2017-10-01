[{assign var="sFrom" value=""}]
[{assign var="oPrice" value=$oDetailsProduct->getPrice()}]
[{if $oDetailsProduct->isParentNotBuyable() }]
    [{assign var="oPrice" value=$oDetailsProduct->getVarMinPrice()}]
    [{if $oDetailsProduct->isRangePrice() }]
        [{assign var="sFrom" value="PRICE_FROM"|oxmultilangassign}]
    [{/if}]
[{/if}]
<div class="z-productprice">
    <span>[{$sFrom}]</span>
    <strong>
        [{oxprice price=$oPrice currency=$currency}][{if $oView->isVatIncluded() }]<span class="z-vat-included">*</span>[{/if}]
    </strong>
</div>
