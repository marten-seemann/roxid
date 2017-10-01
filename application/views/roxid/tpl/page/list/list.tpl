[{oxscript add="$('a.js-external').attr('target', '_blank');"}]
[{oxscript add="$( '#content' ).oxArticleBox();"}]

[{assign var="actCategory" value=$oView->getActiveCategory()}]


[{capture append="oxidBlock_sidebar"}]
    [{assign var="listType" value=$oView->getListType()}]
    [{if $listType=='manufacturer' || $listType=='vendor'}]
        [{if $actCategory && $actCategory->getIconUrl()}]
        <div class="panel panel-default z-sidebarblock">
            <div class="panel-heading">
                <h3 class="panel-title">
                    [{if $listType=='manufacturer'}]
                        [{ oxmultilang ident="BRAND" }]
                    [{elseif $listType=='vendor'}]
                        [{ oxmultilang ident="VENDOR" }]
                    [{/if}]
                </h3>
            </div>
            <div class="panel-body">
                <div class="z-brand-icon">
                    <img src="[{$actCategory->getIconUrl()}]" alt="[{$actCategory->getTitle()}]" class="img-responsive">
                </div>
            </div>
        </div>
        [{/if}]
    [{/if}]
[{/capture}]

[{capture append="oxidBlock_content"}]
    [{if $oView->getArticleList()|@count > 0}]
        [{assign var="hasarticles" value=true}]
    [{else}]
        [{assign var="hasarticles" value=false}]
    [{/if}]

    [{if $actCategory->oxcategories__oxthumb->value && $actCategory->getThumbUrl()}]
        <img src="[{$actCategory->getThumbUrl()}]" alt="[{$actCategory->oxcategories__oxtitle->value}]" class="z-category-picture img-responsive">
    [{/if}]

    <div class="page-header">
        <h1>[{$oView->getTitle()}]
            [{assign var='rsslinks' value=$oView->getRssLinks() }]
            [{ if $rsslinks.activeCategory}]
                <a class="rss js-external" id="rssActiveCategory" href="[{$rsslinks.activeCategory.link}]" title="[{$rsslinks.activeCategory.title}]">[{$oViewConf->getRoxidIcon('rss')}]</a>
            [{/if }]
            [{if $listType!='tag' && $actCategory && $actCategory->getShortDescription() }]
                <small>[{$actCategory->getShortDescription()}]</small>
            [{/if}]
        </h1>
    </div>

    [{if $actCategory->oxcategories__oxlongdesc->value }]
        <div class="z-category-description">[{oxeval var=$actCategory->oxcategories__oxlongdesc}]</div>
    [{/if}]

    [{if $oView->hasVisibleSubCats()}]
        [{assign var="iSubCategoriesCount" value=0}]
        [{oxscript add="if(!Modernizr.flexbox) { $(window).on('load', function() { oxEqualizer.equalHeight( $('.z-subcat-list li .z-category-box' )); }); }"}]
        <div class="z-subcat-list">
            <ul class="list-unstyled">
                [{foreach from=$oView->getSubCatList() item=category name=MoreSubCat}]
                    [{ if $category->getContentCats() }]
                        [{foreach from=$category->getContentCats() item=ocont name=MoreCms}]
                            [{assign var="iSubCategoriesCount" value=$iSubCategoriesCount+1}]
                            <li>
                                <div class="z-category-box z-category-box-no-icon">
                                    <h3>
                                        <a id="moreSubCms_[{$smarty.foreach.MoreSubCat.iteration}]_[{$smarty.foreach.MoreCms.iteration}]" href="[{$ocont->getLink()}]">[{ $ocont->oxcontents__oxtitle->value }]</a>
                                    </h3>
                                    <div class="z-category-box-body">
                                        <ul class="list-unstyled"></ul>
                                    </div>
                                </div>
                            </li>
                        [{/foreach}]
                    [{/if }]

                    [{if $category->getIsVisible()}]
                        [{assign var="iSubCategoriesCount" value=$iSubCategoriesCount+1}]
                        [{assign var="iconUrl" value=$category->getIconUrl()}]
                            <li>
                                <div class="z-category-box [{if !$iconUrl}]z-category-box-no-icon[{/if}]">
                                    <h3>
                                        <a id="moreSubCat_[{$smarty.foreach.MoreSubCat.iteration}]" href="[{ $category->getLink() }]">
                                            [{$category->oxcategories__oxtitle->value }][{ if $oView->showCategoryArticlesCount() && ($category->getNrOfArticles() > 0) }] ([{ $category->getNrOfArticles() }])[{/if}]
                                        </a>
                                    </h3>
                                    [{if $category->getHasVisibleSubCats()}]
                                        <div class="z-category-box-body">
                                            <ul class="list-unstyled">
                                                [{if $iconUrl}]
                                                    <li class="z-subcat-pic">
                                                        <a href="[{ $category->getLink() }]">
                                                            <img src="[{$category->getIconUrl() }]" alt="[{ $category->oxcategories__oxtitle->value }]" class="img-responsive">
                                                        </a>
                                                    </li>
                                                [{/if}]
                                                [{foreach from=$category->getSubCats() item=subcategory}]
                                                    [{if $subcategory->getIsVisible() }]
                                                        [{ foreach from=$subcategory->getContentCats() item=ocont name=MoreCms}]
                                                            <li>
                                                                <a href="[{$ocont->getLink()}]"><strong>[{ $ocont->oxcontents__oxtitle->value }]</strong></a>
                                                            </li>
                                                        [{/foreach }]
                                                        <li>
                                                            <a href="[{ $subcategory->getLink() }]">
                                                                <strong>[{ $subcategory->oxcategories__oxtitle->value }]</strong>[{ if $oView->showCategoryArticlesCount() && ($subcategory->getNrOfArticles() > 0) }] ([{ $subcategory->getNrOfArticles() }])[{/if}]
                                                            </a>
                                                        </li>
                                                     [{/if}]
                                                [{/foreach}]
                                            </ul>
                                        </div>
                                    [{else}]
                                        <div>
                                            <div>
                                            [{if $iconUrl}]
                                                <a href="[{ $category->getLink() }]">
                                                    <img src="[{$category->getIconUrl() }]" alt="[{ $category->oxcategories__oxtitle->value }]" class="img-responsive">
                                                </a>
                                             [{/if}]
                                            </div>
                                        </div>
                                    [{/if}]
                                </div>
                            </li>
                    [{/if}]
                [{/foreach}]
            </ul>
        </div>
    [{/if}]


    [{if $hasarticles}]
        [{* <div class="listRefine clear bottomRound"> *}]
        [{* uncomment if want to use descriptions in locator
           [{if $actCategory && $actCategory->getShortDescription() }]
                <div id="catDescLocator" class="categoryDescription">[{$actCategory->getShortDescription()}]</div>
            [{/if}]

            [{if $actCategory->oxcategories__oxlongdesc->value }]
                <div id="catLongDescLocator" class="categoryDescription">[{oxeval var=$actCategory->oxcategories__oxlongdesc}]</div>
            [{/if}]
        *}]

        [{include file="widget/locator/listlocator.tpl" place="top" locator=$oView->getPageNavigationLimitedTop() attributes=$oView->getAttributes() listDisplayType=true itemsPerPage=true sort=true }]
        [{* </div> *}]
        [{* List types: grid|line|infogrid *}]
        [{include file="widget/product/list.tpl" type=$oView->getListDisplayType() listId="productList" products=$oView->getArticleList() lazyLoading=$lazyLoading}]
        <div class="clear"></div>
        <div class="hidden-xs">
            [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigationLimitedBottom() place="bottom"}]
        </div>
        <div class="visible-xs">
            [{include file="widget/locator/listlocator.tpl" place="top" locator=$oView->getPageNavigationLimitedTop() attributes=$oView->getAttributes() listDisplayType=true itemsPerPage=true sort=true }]
        </div>
    [{/if}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left" tree_path=$oView->getTreePath()}]
