[{assign var="mode" value=$oView->getViewParameter('mode')}]

[{assign var="homeSelected" value="false"}]
[{if $oViewConf->getTopActionClassName() == 'start'}]
    [{assign var="homeSelected" value="true"}]
[{/if}]
[{assign var="oxcmp_categories" value=$oxcmp_categories }]
[{assign var="blShowMore" value=false }]
[{assign var="iCatCnt" value=0}]

<ul class="nav navbar-nav" role="menu">
    [{if $oViewConf->getViewThemeParam('blShowHomeInNavigation')}]
        <li class="[{if $homeSelected == 'true' }]mm-opened active[{/if}]"><a [{if $homeSelected == 'true'}]class="active"[{/if}] href="[{$oViewConf->getHomeLink()}]">[{oxmultilang ident="HOME"}]</a></li>
    [{/if}]

    [{foreach from=$oxcmp_categories item=ocat key=catkey name=root}]
        [{if $ocat->getIsVisible() }]
            [{foreach from=$ocat->getContentCats() item=oTopCont name=MoreTopCms}]
                [{assign var="iCatCnt" value=$iCatCnt+1 }]

                [{if $iCatCnt <= $oView->getTopNavigationCatCnt()}]
                    <li class="[{if $mode=='bootstrap'}]dropdown2[{/if}]"><a href="[{$oTopCont->getLink()}]" class="dropdown-toggle [{if $oTopCont->expanded}]mm-opened active[{/if}]">[{$oTopCont->oxcontents__oxtitle->value}]</a></li>
                [{else}]
                    [{assign var="blShowMore" value=true }]
                    [{capture append="moreLinks"}]
                        <li><a href="[{$oTopCont->getLink()}]">[{$oTopCont->oxcontents__oxtitle->value}]</a></li>
                    [{/capture}]
                [{/if}]
            [{/foreach}]

            [{assign var="iCatCnt" value=$iCatCnt+1 }]
            [{if $iCatCnt <= $oView->getTopNavigationCatCnt() }]
                <li class="[{if $mode=='bootstrap'}]dropdown[{/if}] [{if $homeSelected == 'false' && $ocat->expanded}]mm-opened active[{/if}]">
                    <a class="[{if $mode=='bootstrap'}]dropdown-toggle[{/if}] [{if $homeSelected == 'false' && $ocat->expanded}]active[{/if}]"  role="button" href="[{$ocat->getLink()}]" data-target="#">
                        [{$ocat->oxcategories__oxtitle->value}]
                        [{ if $oView->showCategoryArticlesCount() && ($ocat->getNrOfArticles() > 0) }]
                            <span class="hidden-xs">([{$ocat->getNrOfArticles()}])</span>
                        [{/if}]
                        [{if $mode=='bootstrap'}]
                            [{if $ocat->getHasVisibleSubCats()}] <i class="fa fa-caret-down"></i>[{/if}]
                        [{/if}]
                    </a>
                    [{if $ocat->getSubCats() && $ocat->getHasVisibleSubCats() }]
                        <ul class="[{if $mode=='bootstrap'}]dropdown-menu[{/if}]" role="menu">
                            [{foreach from=$ocat->getSubCats() item=osubcat key=subcatkey name=SubCat}]
                                [{if $osubcat->getIsVisible() }]
                                    [{foreach from=$osubcat->getContentCats() item=ocont name=MoreCms}]
                                        <li tabindex="-1" [{if $mode=='bootstrap'}]role="menuitem"[{/if}]>
                                            <a href="[{$ocont->getLink()}]">[{$ocont->oxcontents__oxtitle->value}]</a>
                                        </li>
                                    [{/foreach}]
                                    [{if $osubcat->getIsVisible() }]
                                        [{if $oViewConf->getViewThemeParam('blShowNavbarSubMenus') || $mode=="panelmenu"}]
                                            [{assign var="showSubCats" value=$osubcat->getHasVisibleSubCats()}]
                                        [{else}]
                                            [{assign var="showSubCats" value=false}]
                                        [{/if}]
                                        <li tabindex="-1" [{if $mode=='bootstrap'}]role="menuitem"[{/if}] class="[{if $homeSelected == 'false' && $osubcat->expanded}]current[{/if}] [{if $showSubCats}]dropdown-submenu[{/if}]">
                                            <a [{if $homeSelected == 'false' && $osubcat->expanded}]class="current"[{/if}] href="[{$osubcat->getLink()}]">
                                                [{$osubcat->oxcategories__oxtitle->value}]
                                                [{ if $oView->showCategoryArticlesCount() && ($osubcat->getNrOfArticles() > 0)}]
                                                    <span class="hidden-xs">([{$osubcat->getNrOfArticles()}])</span>
                                                [{/if}]
                                            </a>
                                            [{if $showSubCats}]
                                                <ul class="dropdown-menu">
                                                    [{foreach from=$osubcat->getSubCats() item=osubsubcat key=subsubcatkey name=SubSubCat}]
                                                        [{if $osubsubcat->getIsVisible() }]
                                                            <li tabindex="-1">
                                                                <a [{if $homeSelected == 'false' && $osubcat->expanded}]class="current"[{/if}] href="[{$osubsubcat->getLink()}]">
                                                                    [{$osubsubcat->oxcategories__oxtitle->value}]
                                                                    [{ if $oView->showCategoryArticlesCount() && ($osubsubcat->getNrOfArticles() > 0)}]
                                                                        <span class="hidden-xs">([{$osubsubcat->getNrOfArticles()}])</span>
                                                                    [{/if}]
                                                                </a>
                                                            </li>
                                                        [{/if}]
                                                    [{/foreach}]
                                                </ul>
                                            [{/if}]
                                        </li>
                                    [{/if}]
                                [{/if}]
                            [{/foreach}]
                        </ul>
                    [{/if}]
                </li>
            [{else}]
                [{capture name="link" assign="link"}]
                    <a class="[{if $homeSelected == 'false' && $ocat->expanded}]active[{/if}]" href="[{$ocat->getLink()}]">
                        [{$ocat->oxcategories__oxtitle->value}]
                        [{ if $oView->showCategoryArticlesCount() && ($ocat->getNrOfArticles() > 0)}]
                            <span class="hidden-xs">([{$ocat->getNrOfArticles()}])</span>
                        [{/if}]
                    </a>
                [{/capture}]
                [{capture append="moreLinks"}]
                    [{assign var="blShowMore" value=true }]
                    <li tabindex="-1" role="menuitem">
                        [{$link}]
                   </li>
                [{/capture}]
                [{capture append="moreLinksMobile"}]
                    <li tabindex="-1" role="menuitem" class="visible-xs">
                        [{$link}]
                   </li>
                [{/capture}]
            [{/if}]
        [{/if}]
    [{/foreach}]
    [{if $blShowMore }]
        <li class="[{if $mode=='bootstrap'}]dropdown[{/if}] hidden-xs">
            [{assign var="_catMoreUrl" value=$oView->getCatMoreUrl()}]
            <a [{if $mode=='bootstrap'}]class="dropdown-toggle"[{/if}] href="[{ oxgetseourl ident="`$_catMoreUrl`&amp;cl=alist" }]">
                [{ oxmultilang ident="MORE" }]
                [{if $mode=='bootstrap'}]<i class="fa fa-caret-down"></i>[{/if}]
            </a>
            <ul [{if $mode=='bootstrap'}]class="dropdown-menu dropdown-menu-right" role="menu"[{/if}]>
                [{foreach from=$moreLinks item=link}]
                    [{$link}]
                [{/foreach}]
            </ul>
        </li>
        [{foreach from=$moreLinksMobile item=link}]
            [{$link}]
        [{/foreach}]
    [{/if}]
</ul>
[{oxscript widget=$oView->getClassName()}]
[{oxstyle widget=$oView->getClassName()}]
