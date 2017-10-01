[{block name="widget_locator_sort"}]
    [{if $oView->showSorting()}]
        [{assign var="_listType" value=$oView->getListDisplayType()}]
        [{assign var="_additionalParams" value=$oView->getAdditionalParams()}]
        [{assign var="_artPerPage" value=$oViewConf->getArtPerPageCount()}]
        [{assign var="_sortColumnVarName" value=$oView->getSortOrderByParameterName()}]
        [{assign var="_sortDirectionVarName" value=$oView->getSortOrderParameterName()}]
        <div class="dropdown">
            <strong>[{ oxmultilang ident="SORT_BY" suffix="COLON"}]</strong>
            <div class="z-options">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    [{if $oView->getListOrderBy() }]
                        [{oxmultilang ident=$oView->getListOrderBy()|upper}]
                    [{else}]
                        [{oxmultilang ident="CHOOSE"}]
                    [{/if}]

                    [{if $oView->getListOrderBy() }]
                        [{if $oView->getListOrderDirection() == "asc" }]
                            [{$oViewConf->getRoxidIcon('sort_asc')}]
                        [{else}]
                            [{$oViewConf->getRoxidIcon('sort_desc')}]
                        [{/if}]
                    [{/if}]
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-menu-right">
                    [{foreach from=$oView->getSortColumns() item=sColumnName}]
                        <li class="desc">
                            <a href="[{ $oView->getBaseLink()|oxaddparams:"ldtype=$_listType&amp;_artperpage=$_artPerPage&amp;$_sortColumnVarName=$sColumnName&amp;$_sortDirectionVarName=desc&amp;pgNr=0&amp;$_additionalParams"}]" [{if $oView->getListOrderDirection() == 'desc' && $sColumnName == $oView->getListOrderBy()}] class="selected"[{/if}]><span>[{ oxmultilang ident=$sColumnName|upper }] [{$oViewConf->getRoxidIcon('sort_desc')}]</span></a>
                        </li>
                        <li class="asc">
                            <a href="[{ $oView->getBaseLink()|oxaddparams:"ldtype=$_listType&amp;_artperpage=$_artPerPage&amp;$_sortColumnVarName=$sColumnName&amp;$_sortDirectionVarName=asc&amp;pgNr=0&amp;$_additionalParams"}]" [{if $oView->getListOrderDirection() == 'asc' && $sColumnName == $oView->getListOrderBy()}] class="selected"[{/if}]><span>[{ oxmultilang ident=$sColumnName|upper }] [{$oViewConf->getRoxidIcon('sort_asc')}]</span></a>
                        </li>
                    [{/foreach}]
                </ul>
            </div>
        </div>
    [{/if}]
[{/block}]
