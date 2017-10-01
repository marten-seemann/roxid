[{capture append="oxidBlock_content"}]
    [{assign var="oNews" value=$oView->getNews() }]
    <div class="page-header">
        <h1>[{ $oView->getTitle() }]</h1>
    </div>

    [{if !empty($oNews)}]
        [{foreach from=$oNews item=oNewsEntry}]
            [{if !empty($oNewsEntry) && !empty($oNewsEntry->oxnews__oxshortdesc->value)}]
                <div>
                    <h3>
                        <span>[{$oNewsEntry->oxnews__oxdate->value|date_format:"%d.%m.%Y"}] - </span> [{$oNewsEntry->oxnews__oxshortdesc->value}]
                    </h3>
                    [{$oNewsEntry->getLongDesc() force=1}]
                </div>
            [{/if}]
        [{/foreach}]
    [{else}]
        [{ oxmultilang ident="LATEST_NEWS_NOACTIVENEWS" }]
    [{/if}]

    [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigation() place="bottom"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]
