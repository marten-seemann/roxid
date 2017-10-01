<div class="z-productlist-controls [{if $place}]z-productlist-controls-[{$place}][{/if}]">
    [{if $sort || $itemsPerPage || $listDisplayType || $attributes }]
        <div class="z-productlist-filter hidden-xs">
            [{if $attributes }]
                <div class="z-attribute-filter pull-left">
                    [{include file="widget/locator/attributes.tpl"}]
                    [{oxscript add="$('.z-attribute-filter .dropdown > a').oxDropDown();"}]
                </div>
            [{/if}]
            [{if $sort || $itemsPerPage || $listDisplayType }]
                <div class="z-productlist-viewoptions pull-right">
                    [{if $sort }]
                        [{include file="widget/locator/sort.tpl"}]
                    [{/if}]
                    [{if $itemsPerPage }]
                        [{include file="widget/locator/itemsperpage.tpl"}]
                    [{/if}]
                    [{if $listDisplayType }]
                        [{include file="widget/locator/listdisplaytype.tpl"}]
                    [{/if}]
                </div>
            [{/if}]
            <div class="clear"></div>
        </div>
    [{/if}]

    [{if $locator}]
        [{if $locator->changePage}]<div class="clear"></div>[{/if}]
        <div class="z-productlist-pagination">
            [{include file="widget/locator/paging.tpl" pages=$locator place=$place}]
        </div>
        <div class="clear"></div>
    [{/if}]
</div>
