[{oxscript add="$('a.js-external').attr('target', '_blank');"}]
[{assign var="_oRecommendationList" value=$oView->getSimilarRecommLists()}]
[{assign var="oRecommList" value=$oView->getRecommList() }]

[{ if $_oRecommendationList || $oRecommList->getRecommSearch() }]
<div class="panel panel-default z-sidebarblock z-recommendations-box" id="recommendationsBox">
    <div class="panel-heading">
        <h3 class="panel-title">[{ oxmultilang ident="LISTMANIA" }]
        [{assign var='rsslinks' value=$oRecommList->getRssLinks() }]
        [{if $rsslinks.recommlists}]
            <a class="rss js-external" id="rssRecommLists" href="[{$rsslinks.recommlists.link}]" title="[{$rsslinks.recommlists.title}]">
                [{$oViewConf->getRoxidIcon('rss')}]<span class="FXgradOrange corners glowShadow">[{$rsslinks.recommlists.title}]</span>
            </a>
        [{/if}]
        </h3>
    </div>

    <div class="panel-body">
    [{ if $_oRecommendationList }]
        [{$_oRecommendationList->rewind()}]

        [{if $_oRecommendationList->current()}]
               [{assign var="_oFirstRecommendationList" value=$_oRecommendationList->current()}]
            [{assign var="_oBoxTopProduct" value=$_oFirstRecommendationList->getFirstArticle()}]
            [{assign var="_sTitle" value="`$_oBoxTopProduct->oxarticles__oxtitle->value` `$_oBoxTopProduct->oxarticles__oxvarselect->value`"|strip_tags}]
            <div class="z-recommendations-picture">
                <a href="[{$_oBoxTopProduct->getMainLink()}]" class="featured" title="[{$_sTitle}]">
                    <img src="[{ $oViewConf->getImageUrl('grey.gif') }]" data-original="[{$_oBoxTopProduct->getIconUrl()}]" class="lazy" alt="[{$_sTitle}]">
                </a>
            </div>
        [{/if}]
    [{/if}]
        <ul class="featuredList list-unstyled">
        [{ if $_oRecommendationList }]
            [{foreach from=$_oRecommendationList item=_oListItem name="testRecommendationsList"}]
                <li>
                    <a href="[{ $_oListItem->getLink() }]"><b>[{ $_oListItem->oxrecommlists__oxtitle->value|strip_tags }]</b></a>
                    <div class="desc">[{ oxmultilang ident="LIST_BY" suffix="COLON" }] [{ $_oListItem->oxrecommlists__oxauthor->value|strip_tags }]</div>
                </li>
            [{/foreach}]
        [{/if}]
            [{if $_oRecommendationList || $oRecommList->getRecommSearch()}]
            <li>
                <form name="basket" class="form-search recommendationsSearchForm" action="[{ $oViewConf->getSelfActionLink() }]" method="post">
                    <div>
                        <input type="hidden" name="cl" value="recommlist">
                        [{ $oViewConf->getHiddenSid() }]
                    </div>
                    <label class="visible-lg">[{oxmultilang ident="SEARCH_FOR_LISTS" suffix="COLON" }]</label>
                    <div>
                      <div class="input-group">
                          <input type="text" class="form-control " name="searchrecomm" id="searchRecomm2" value="[{$oRecommList->getRecommSearch()}]">
                          <span class="input-group-btn">
                              <button type="submit" class="btn btn-default btn-search">[{ oxmultilang ident="GO" }]</button>
                          </span>
                      </div>
                    </div>
                </form>
            </li>
            [{/if}]
        </ul>
    </div>
</div>
[{/if}]
[{oxscript widget=$oView->getClassName()}]
