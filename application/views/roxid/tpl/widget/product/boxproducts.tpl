[{oxscript add="$('a.js-external').attr('target', '_blank');"}]
[{oxscript add="$( 'ul.js-articleBox' ).oxArticleBox();" }]
[{assign var="currency" value=$oView->getActCurrency()}]

<div class="panel panel-default z-sidebarblock z-sidebar-productlist" [{if $_boxId}]id="[{$_boxId}]"[{/if}]>
    [{if $_sHeaderIdent}]
        <div class="panel-heading">
            <h3 class="panel-title">
                [{ oxmultilang ident=$_sHeaderIdent }]
                [{assign var='rsslinks' value=$oView->getRssLinks() }]
                [{if $rsslinks.topArticles}]
                    <a class="rss js-external" id="rssTopProducts" href="[{$rsslinks.topArticles.link}]" title="[{$rsslinks.topArticles.title}]">[{$oViewConf->getRoxidIcon('rss')}]</a>
                [{/if}]
            </h3>
        </div>
    [{/if}]
    <div class="panel-body">
        <ul class="js-articleBox featuredList z-featured-list list-unstyled">
            [{foreach from=$_oBoxProducts item=_oBoxProduct name=_sProdList}]
                [{assign var="iProdCount" value=$smarty.foreach._sProdList.first}]
                [{oxid_include_widget cl="oxwArticleBox" _parent=$oView->getClassName() _navurlparams=$oViewConf->getNavUrlParams() iLinkType=$_oBoxProduct->getLinkType() _object=$_oBoxProduct anid=$_oBoxProduct->getId() isVatIncluded=$oView->isVatIncluded() iProdCount=$iProdCount nocookie=1 sWidgetType=product sListType=boxproduct inlist=$_oBoxProduct->isInList() skipESIforUser=1}]
            [{/foreach}]
        </ul>
    </div>
</div>
