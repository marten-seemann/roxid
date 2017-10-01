[{if $oViewConf->getViewThemeParam("blShowMapOnContactPage")}]
    <div id="z-map">
        [{assign var="address" value=$oxcmp_shop->oxshops__oxstreet->value|cat:', '|cat:$oxcmp_shop->oxshops__oxzip->value|cat:' '|cat:$oxcmp_shop->oxshops__oxcity->value|cat:', '|cat:$oxcmp_shop->oxshops__oxcountry->value}]
        <iframe src="https://maps.google.com/maps?q=[{$address|@urlencode}]&amp;hq=abcd&amp;output=embed" frameborder="0"></iframe>
    </div>
[{/if}]
