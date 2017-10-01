[{capture append="oxidBlock_content"}]
    [{if $oView->getTagCloudManager() }]
        <div class="page-header">
            <h1>[{ $oView->getTitle() }]</h1>
        </div>
        <div>
            [{assign var="oCloudManager" value=$oView->getTagCloudManager() }]
            [{assign var="oTagSet" value=$oCloudManager->getCloudArray() }]
            [{foreach from=$oTagSet item=oTag }]
                <a class="tagitem_[{ $oCloudManager->getTagSize($oTag->getTitle()) }]" href="[{ $oTag->getLink() }]">[{ $oTag->getTitle() }]</a>
            [{/foreach}]
        </div>
    [{/if}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]
