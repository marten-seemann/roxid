[{assign var="_additionalParams" value=$oView->getAdditionalParams()}]
[{assign var="_listType" value=$oView->getListDisplayType()}]
<div class="dropdown">
    <strong>[{oxmultilang ident="PRODUCTS_PER_PAGE" suffix="COLON"}]</strong>
    <div class="z-options">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            [{if $oViewConf->getArtPerPageCount() }]
                [{ $oViewConf->getArtPerPageCount() }]
            [{else}]
                [{ oxmultilang ident="CHOOSE" }]
            [{/if}]
            <i class="fa fa-caret-down"></i>
        </a>
        <ul class="dropdown-menu dropdown-menu-right">
            [{foreach from=$oViewConf->getNrOfCatArticles() item=iItemsPerPage}]
                <li><a href="[{$oView->getBaseLink()|oxaddparams:"ldtype=$_listType&amp;_artperpage=$iItemsPerPage&amp;pgNr=0&amp;$_additionalParams"}]" rel="nofollow" [{if $oViewConf->getArtPerPageCount() == $iItemsPerPage }] class="selected"[{/if}]>[{$iItemsPerPage}]</a></li>
            [{/foreach}]
        </ul>
    </div>
</div>
