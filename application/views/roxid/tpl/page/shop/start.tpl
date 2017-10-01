[{capture append="oxidBlock_content"}]
    [{assign var="oFirstArticle" value=$oView->getFirstArticle()}]
    [{if $oView->getCatOfferArticleList()|@count > 0}]
        [{foreach from=$oView->getCatOfferArticleList() item=actionproduct name=CatArt}]
        [{if $smarty.foreach.CatArt.first}]
        [{assign var="oCategory" value=$actionproduct->getCategory()}]
            [{if $oCategory }]
                [{assign var="promoCatTitle" value=$oCategory->oxcategories__oxtitle->value}]
                [{assign var="promoCatImg" value=$oCategory->getPromotionIconUrl()}]
                [{assign var="promoCatLink" value=$oCategory->getLink()}]
            [{/if}]
        [{/if}]
        [{/foreach}]
    [{/if}]

    [{ assign var="oStartWelcomeCont" value=$oView->getContentByIdent("oxstartwelcome") }]
    [{if $oView->getBargainArticleList()|@count > 0 || $oStartWelcomeCont->oxcontents__oxactive->value == 1 }]
        <div class="z-promoboxes row">
            <div class="col-sm-24 z-start-welcome">
                [{if $oStartWelcomeCont->oxcontents__oxactive->value == 1}]
                    [{ oxcontent ident=oxstartwelcome }]
                [{/if}]
            </div>

            [{if false && $promoCatTitle && $promoCatImg}]
                <div id="specCatBox" class="z-category-box z-specbox-cat visible-lg">
                    <h2 class="sectionHead">[{$promoCatTitle}]</h2>
                    <div>
                        [{*<a href="[{$promoCatLink}]" class="viewAllHover glowShadow corners"><span>[{ oxmultilang ident="PAGE_SHOP_START_VIEW_ALL" }]</span></a>*}]
                        <a href="[{$promoCatLink}]" alt="[{ oxmultilang ident="VIEW_ALL_PRODUCTS" }]" title="[{ oxmultilang ident="VIEW_ALL_PRODUCTS" }]"><img src="[{$promoCatImg}]" alt="[{$promoCatTitle}]"></a>
                    </div>
                </div>
            [{/if}]
        </div>
        <hr class="hidden-sm">
    [{/if}]

    [{if $oView->getNewestArticles() }]
        [{assign var='rsslinks' value=$oView->getRssLinks() }]
        [{include file="widget/product/list.tpl" type=$oViewConf->getViewThemeParam('sStartPageListDisplayType') isStartPage=true head="JUST_ARRIVED"|oxmultilangassign listId="newItems" products=$oView->getNewestArticles() rsslink=$rsslinks.newestArticles rssId="rssNewestProducts" showMainLink=true}]
    [{/if}]

    [{if $oViewConf->getViewThemeParam('blShowManufacturerSlider')}]
        [{capture name=manufacturerSliderCode assign=manufacturerSliderCode}]
            [{if $oView->getNewestArticles() }]
                <hr class="hidden-xs">
            [{/if}]
            <div id="manufacturer-slider" class="hidden-xs">
                [{ include file="widget/manufacturersslider.tpl"}]
            </div>
        [{/capture}]
        <div id="manufacturer_slider"></div>

        [{include file="widget/conditional_content.tpl" code=$manufacturerSliderCode  html_id="manufacturer_slider"}]
    [{/if}]

[{/capture}]
[{include file="layout/page.tpl" sidebar="Right"}]
