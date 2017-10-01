[{assign var="oDetailsProduct" value=$oView->getProduct() }]
[{if $oView->showTags() && $oView->getTagCloudManager() && $oDetailsProduct && $oView->canChangeTags()}]
    [{assign var="oCloudManager" value=$oView->getTagCloudManager()}]
    <div class="tagError z-tag-error inlist alert alert-danger alert-dismissable">
        <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        [{oxmultilang ident="ALREADY_ADDED_TAG" suffix="COLON" }] <span class="errorMessage"></span>
    </div>

    <div class="tagError z-tag-error invalid alert alert-danger">
        <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        [{oxmultilang ident="INVALID_TAGS_REMOVED" suffix="COLON" }]
        <span class="errorMessage"></span>
    </div>

    <form action="[{$oViewConf->getSelfActionLink()}]#tags" method="post" class="tagsForm form-horizontal">
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
        <input type="hidden" name="aid" value="[{$oDetailsProduct->oxarticles__oxid->value}]">
        <input type="hidden" name="anid" value="[{$oDetailsProduct->oxarticles__oxnid->value}]">
        <input type="hidden" id="tagsInput" name="highTags">
        <input type="hidden" name="fnc" value="addTags">

        <div class="z-tag-cloud tagCloud">
            [{include file="page/details/inc/tagcloud.tpl" oCloudManager=$oCloudManager}]
        </div>
        <div class="clear"></div>

        <div class="z-tags-add">
            <div class="input-group">
                <input type="text" class="newTags form-control" name="newTags" maxlength="[{$oCloudManager->getTagMaxLength()}]" placeholder="[{oxmultilang ident="ADD_TAGS"}]" required>
                <span class="input-group-btn">
                    <button type="submit" class="saveTag btn btn-primary">[{oxmultilang ident="SUBMIT"}]</button>
                </span>
            </div>
        </div>
        <button type="submit" class="cancelTag btn btn-default">[{oxmultilang ident="CANCEL"}]</button>
    </form>
[{/if}]
