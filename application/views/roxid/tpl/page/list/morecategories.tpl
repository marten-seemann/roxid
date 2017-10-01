[{oxscript add="$( '#content' ).oxArticleBox();"}]
[{capture append="oxidBlock_content"}]
<div class="page-header">
    <h1>[{ $oView->getTitle() }]</h1>
</div>

<div class="z-subcat-list">
    [{assign var="_navcategorytree" value=$oView->getCategoryTree()}]
    [{assign var="_iCategoriesPerRow"  value=4}]
    [{assign var="iSubCategoriesCount" value=0}]
    [{if $_navcategorytree|count}]
        [{oxscript add="if(!Modernizr.flexbox) { $(window).on('load', function() { oxEqualizer.equalHeight( $('.z-subcat-list li .z-category-box' )); }); }"}]
        <ul class="z-subcat-list list-unstyled">
            [{foreach from=$_navcategorytree item=category name=MoreSubCat}]
                [{* TOP categories *}]
                [{if $category->getIsVisible()}]
                    [{* CMS top categories *}]
                    [{if $category->getContentCats() }]
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
                    [{assign var="iSubCategoriesCount" value=$iSubCategoriesCount+1}]
                    [{assign var="iconUrl" value=$category->getIconUrl()}]
                    <li>
                        <div class="z-category-box [{if !$iconUrl}]z-category-box-no-icon[{/if}]">
                            <h3>
                                <a id="moreSubCat_[{$smarty.foreach.MoreSubCat.iteration}]" href="[{ $category->getLink() }]">
                                    [{$category->oxcategories__oxtitle->value }][{ if $oView->showCategoryArticlesCount() && ($category->getNrOfArticles() > 0) }] ([{ $category->getNrOfArticles() }])[{/if}]
                                </a>
                            </h3>
                            [{* Top categories subcategories *}]
                            [{if $category->getHasVisibleSubCats()}]
                                <div class="z-category-box-body">
                                    <ul class="list-unstyled">
                                        [{if $iconUrl}]
                                            <li>
                                                <a href="[{ $category->getLink() }]">
                                                    <img src="[{$category->getIconUrl() }]" alt="[{ $category->oxcategories__oxtitle->value }]" class="img-responsive">
                                                </a>
                                            </li>
                                        [{/if}]
                                        [{foreach from=$category->getSubCats() item=subcategory}]
                                            [{if $subcategory->getIsVisible() }]
                                                [{* CMS subcategories  *}]
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
                            [{elseif $iconUrl}]
                                <div class="z-category-box-body">
                                    <div>
                                        [{if $iconUrl}]
                                        <a href="[{ $category->getLink() }]">
                                            <img src="[{$category->getIconUrl() }]" alt="[{ $category->oxcategories__oxtitle->value }]" class="img-responsive">
                                        </a>
                                        [{/if}]
                                    </div>
                                </div>
                            [{else}]
                                <div></div>
                            [{/if}]
                        </div>
                    </li>
            [{/if}]
        [{/foreach}]
        </li>
        </ul>
    [{/if}]
</div>
[{/capture}]

[{include file="layout/page.tpl" sidebar="Left"}]
