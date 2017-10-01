[{if $oxcmp_categories }]
    [{if $oViewConf->getViewThemeParam('blShowCompleteCategoryTreeSidebar')}]
        [{assign var="categories" value=$oxcmp_categories}]
    [{else}]
        [{assign var="categories" value=$oxcmp_categories->getClickRoot()}]
    [{/if}]
    [{assign var="act" value=$oxcmp_categories->getClickCat() }]

    [{if $categories }]
        [{assign var="deepLevel" value=$oView->getDeepLevel()}]
        <div class="z-sidebarblock">
            <ul class="z-category-tree list-unstyled">
               [{include file="widget/sidebar/categorytree_inner.tpl" categories=$categories act=$act deepLevel=$deepLevel() iconPos="left"}]
            </ul>
        </div>
    [{/if}]
[{/if}]
