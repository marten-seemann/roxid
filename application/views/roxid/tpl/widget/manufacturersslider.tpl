[{if $oView->getManufacturerForSlider()|@count > 0}]
    <h2>[{ oxmultilang ident="OUR_BRANDS" }]</h2>
    <div class="z-manufacturer-carousel fat-nav" id="z-manufacturer-carousel" data-carousel="owl" data-slides="3" data-slides-lg="7" data-slides-md="6" data-slides-sm="5" data-loop="true">
        [{foreach from=$oView->getManufacturerForSlider() item=oManufacturer name=manufacturerslider}]
            [{if $oManufacturer->oxmanufacturers__oxicon->value }]
            [{counter assign="slideCount"}]
                <div>
                    <a href="[{ $oManufacturer->getLink() }]" title="[{ oxmultilang ident="VIEW_ALL_PRODUCTS" }]">
                        <img src="[{$oViewConf->getImageUrl('grey.gif')}]" data-original="[{ $oManufacturer->getIconUrl() }]" class="lazy" alt="[{ $oManufacturer->oxmanufacturers__oxtitle->value }]">
                    </a>
                </div>
            [{/if}]
        [{/foreach}]
    </div>
[{/if}]
