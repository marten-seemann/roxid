<div id="newsBox" class="panel panel-default z-sidebarblock">
    <div class="panel-heading">
        <h3 class="panel-title">[{ oxmultilang ident="NEWS" }]</h3>
    </div>
    <div class="panel-body">
        <ul class="z-sidebarcontent list-unstyled">
            [{foreach from=$oNews item=_oNewsItem name=_sNewsList }]
                <li>
                    [{ $_oNewsItem->getLongDesc()|strip_tags|oxtruncate:100 }]<br>
                    <a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=news" }]#[{$_oNewsItem->oxnews__oxid->value}]" class="z-more">[{ oxmultilang ident="MORE" suffix="ELLIPSIS" }]</a>
                </li>
            [{/foreach}]
        </ul>
    </div>
</div>
