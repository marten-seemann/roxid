[{assign var="listType" value=$oView->getListDisplayType()}]
[{assign var="_additionalParams" value=$oView->getAdditionalParams()}]
[{assign var="_artPerPage" value=$oViewConf->getArtPerPageCount()}]
[{if $oView->canSelectDisplayType()}]
    <div class="dropdown dropdown-menu-right">
        <strong>[{oxmultilang ident="LIST_DISPLAY_TYPE" suffix="COLON" }]</strong>
        <div class="z-options">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <span>[{oxmultilang ident=$listType}]</span>
                <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-menu-right">
                <li><a href="[{$oView->getBaseLink()|oxaddparams:"ldtype=infogrid&amp;_artperpage=$_artPerPage&amp;pgNr=0&amp;$_additionalParams"}]" [{if $listType eq 'infogrid' }]class="selected" [{/if}]>[{$oViewConf->getRoxidIcon('listtype_infogrid')}] [{oxmultilang ident="infogrid"}]</a></li>
                <li><a href="[{$oView->getBaseLink()|oxaddparams:"ldtype=grid&amp;_artperpage=$_artPerPage&amp;pgNr=0&amp;$_additionalParams"}]" [{if $listType eq 'grid' }]class="selected" [{/if}]>[{$oViewConf->getRoxidIcon('listtype_grid')}] [{oxmultilang ident="grid"}]</a></li>
                <li><a href="[{$oView->getBaseLink()|oxaddparams:"ldtype=line&amp;_artperpage=$_artPerPage&amp;pgNr=0&amp;$_additionalParams"}]" [{if $listType eq 'line' }]class="selected" [{/if}]>[{$oViewConf->getRoxidIcon('listtype_line')}] [{oxmultilang ident="line"}]</a></li>
            </ul>
        </div>
    </div>
[{/if}]
