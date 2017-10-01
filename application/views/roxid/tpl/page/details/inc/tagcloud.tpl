[{if $oCloudManager->getCloudArray()|@count <= 0}]
    [{oxmultilang ident="NO_TAGS"}]
[{/if}]
[{assign var="oTagSet" value=$oCloudManager->getCloudArray() }]

[{foreach from=$oTagSet item=oTag }]
    <div class="label label-default">
        <a class="tagitem_[{ $oCloudManager->getTagSize($oTag->getTitle()) }]" href="[{ $oTag->getLink() }]">[{ $oTag->getTitle() }]</a>
    </div>
[{/foreach}]
