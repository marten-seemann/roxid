[{if $oView->getTagCloudManager() }]
    <div id="tagBox" class="panel panel-default z-sidebarblock">
        <div class="panel-heading">
            <h3 class="panel-title">[{ oxmultilang ident="TAGS" }]</h3>
        </div>
        <div class="panel-body">
            [{assign var="oCloudManager" value=$oView->getTagCloudManager()}]
            [{assign var="oTagSet" value=$oCloudManager->getCloudArray() }]
            [{foreach from=$oTagSet item=oTag }]
                <a class="tagitem_[{ $oCloudManager->getTagSize($oTag->getTitle()) }]" href="[{ $oTag->getLink() }]">[{ $oTag->getTitle() }]</a>
            [{/foreach}]

            [{if $oView->isMoreTagsVisible()}]
                <br>
                <a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=tags" }]" class="z-more">[{ oxmultilang ident="MORE" suffix="ELLIPSIS" }]</a>
            [{/if}]
        </div>
    </div>
[{/if}]
