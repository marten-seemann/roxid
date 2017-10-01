[{assign var="oDetailsProduct" value=$oView->getProduct()}]
[{if $oView->showTags() && ( $oView->getTagCloudManager() || ( $oxcmp_user && $oDetailsProduct ) ) }]
    [{oxscript add="$('p.tagCloud a.tagText').click(oxTag.highTag);"}]
    [{oxscript add="$('.saveTag').click(oxTag.saveTag);"}]
    [{oxscript add="$('.cancelTag').click(oxTag.cancelTag);"}]
    [{oxscript add="$('.editTag').click(oxTag.editTag);"}]

    [{assign var="oCloudManager" value=$oView->getTagCloudManager()}]

    <div class="z-tag-cloud">
        [{include file="page/details/inc/tagcloud.tpl" oCloudManager=$oCloudManager}]
    </div>

    [{if $oDetailsProduct && $oView->canChangeTags()}]
        <form action="[{$oViewConf->getSelfActionLink()}]#tags" class="tagsForm" method="post">
            <div>
                [{$oViewConf->getHiddenSid()}]
                [{$oViewConf->getNavFormParams()}]
                <input type="hidden" name="cl" value="[{$oViewConf->getTopActiveClassName()}]">
                <input type="hidden" name="aid" value="[{$oDetailsProduct->oxarticles__oxid->value}]">
                <input type="hidden" name="anid" value="[{$oDetailsProduct->oxarticles__oxnid->value}]">
                <input type="hidden" name="fnc" value="editTags">
                <button type="submit" class="editTag btn btn-primary">[{$oViewConf->getRoxidIcon('edit')}] [{oxmultilang ident="EDIT_TAGS"}]</button>
            </div>
      </form>
    [{/if}]
[{/if}]
