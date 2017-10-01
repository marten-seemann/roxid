[{if $oDetailsProduct->getTPrice()}]
    <div class="z-oldprice">
        <strong>[{oxmultilang ident="REDUCED_FROM_2"}] <del>[{oxprice price=$oDetailsProduct->getTPrice() currency=$currency}]</del></strong>
    </div>
[{/if}]
