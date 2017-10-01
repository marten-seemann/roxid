[{oxscript add="$('a.js-external').attr('target', '_blank');"}]

[{assign var="fbFirstTabContentPrinted" value=false}]
[{assign var="device" value=$oViewConf->detectDevice()}]

[{capture assign="longdescription"}]
    [{assign var="oLongdesc" value=$oDetailsProduct->getLongDescription()}]
    [{if $oLongdesc->value}]
        [{oxeval var=$oLongdesc}]
        [{if $oDetailsProduct->oxarticles__oxexturl->value}]
            <a id="productExturl" class="js-external" href="http://[{$oDetailsProduct->oxarticles__oxexturl->value}]">
                [{if $oDetailsProduct->oxarticles__oxurldesc->value }]
                    [{$oDetailsProduct->oxarticles__oxurldesc->value }]
                [{else}]
                    [{$oDetailsProduct->oxarticles__oxexturl->value }]
                [{/if}]
            </a>
        [{/if}]
    [{/if}]
[{/capture}]

[{block name="details_tabs_longdescription"}]
    [{oxhasrights ident="SHOWLONGDESCRIPTION"}]
        [{assign var="oLongdesc" value=$oDetailsProduct->getLongDescription()}]

        [{capture append="tabs"}]<a href="#description" data-toggle="tab">[{$oViewConf->getRoxidIcon('product_description')}] [{oxmultilang ident="DESCRIPTION"}]</a>[{/capture}]
        [{capture append="tabsContent"}]
            <div id="description" class="tab-pane active cmsContent">
                [{$longdescription}]
            </div>
        [{/capture}]

        [{capture append="panels"}]<a class="accordion-toggle" data-toggle="collapse" data-parent="#product-panels" aria-expanded="true" href="#collapseDescription">[{$oViewConf->getRoxidIcon('product_description')}] [{oxmultilang ident="DESCRIPTION"}]</a>[{/capture}]
        [{capture append="panelsContent"}]
            <div id="collapseDescription" class="panel-collapse collapse in">
                <div class="panel-body">
                    [{$longdescription}]
                </div>
            </div>
        [{/capture}]
    [{/oxhasrights}]
[{/block}]

[{block name="details_tabs_attributes"}]
    [{if $oView->getAttributes()}]
        [{capture append="tabs"}]<a href="#attributes" data-toggle="tab">[{$oViewConf->getRoxidIcon('product_specification')}] [{oxmultilang ident="SPECIFICATION"}]</a>[{/capture}]
        [{capture append="tabsContent"}]<div id="attributes" class="tab-pane">[{include file="page/details/inc/attributes.tpl"}]</div>[{/capture}]

        [{capture append="panels"}]<a href="#collapseAttributes" class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#product-panels" aria-expanded="false">[{$oViewConf->getRoxidIcon('product_specification')}] [{oxmultilang ident="DETAILS_SPECIFICATION"}]</a>[{/capture}]
        [{capture append="panelsContent"}]
            <div id="collapseAttributes" class="panel-collapse collapse z-specification">
                <div class="panel-body">
                    [{include file="page/details/inc/attributes.tpl"}]
                </div>
            </div>
        [{/capture}]
    [{/if}]
[{/block}]

[{block name="details_tabs_pricealarm"}]
    [{if $oView->isPriceAlarm() && !$oDetailsProduct->isParentNotBuyable()}]
        [{capture append="tabs"}]<a href="#pricealarm" data-toggle="tab">[{$oViewConf->getRoxidIcon('pricealarm')}] [{oxmultilang ident="PRICE_ALERT"}]</a>[{/capture}]
        [{capture append="tabsContent"}]
            <div id="pricealarm" class="tab-pane">
                <div class="row">
                    <div class="col-lg-21">
                        [{include file="form/pricealarm.tpl"}]
                    </div>
                </div>
            </div>
        [{/capture}]

        [{if $oViewConf->getViewThemeParam('blShowPricealarmOnPhone')}]
            [{capture append="panels"}]<a href="#collapsePricealarm" class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#product-panels" aria-expanded="false">[{$oViewConf->getRoxidIcon('pricealarm')}] [{oxmultilang ident="PRICE_ALERT"}]</a>[{/capture}]
            [{capture append="panelsContent"}]
                <div id="collapsePricealarm" class="panel-collapse collapse">
                    <div class="panel-body">
                        [{include file="form/pricealarm.tpl"}]
                    </div>
                </div>
            [{/capture}]
        [{/if}]
    [{/if}]
[{/block}]

[{block name="details_tabs_tags"}]
    [{if $oView->showTags() && ( $oView->getTagCloudManager() || ( ( $oView->getTagCloudManager() || $oxcmp_user) && $oDetailsProduct ) )}]
        [{capture append="tabs"}]<a href="#tags" data-toggle="tab">[{$oViewConf->getRoxidIcon('tags')}] [{oxmultilang ident="TAGS"}]</a>[{/capture}]
        [{capture append="tabsContent"}]<div id="tags" class="tab-pane tags">[{oxid_include_dynamic file="page/details/inc/tags.tpl"}]</div>[{/capture}]
    [{/if}]

    [{if $oViewConf->getViewThemeParam('blShowTagsOnPhone')}]
        [{capture append="panels"}]<a href="#collapseTags" class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#product-panels" aria-expanded="false">[{$oViewConf->getRoxidIcon('tags')}] [{oxmultilang ident="TAGS"}]</a>[{/capture}]
        [{capture append="panelsContent"}]
            <div id="collapseTags" class="panel-collapse collapse">
                <div class="panel-body tags">
                    [{oxid_include_dynamic file="page/details/inc/tags.tpl"}]
                </div>
            </div>
        [{/capture}]
    [{/if}]
[{/block}]

[{block name="details_tabs_media"}]
    [{if $oView->getMediaFiles() || $oDetailsProduct->oxarticles__oxfile->value}]
        [{capture append="tabs"}]<a href="#media" data-toggle="tab">[{$oViewConf->getRoxidIcon('media')}] [{oxmultilang ident="MEDIA"}]</a>[{/capture}]
        [{capture append="tabsContent"}]<div id="media" class="tab-pane">[{include file="page/details/inc/media.tpl"}]</div>[{/capture}]

        [{capture append="panels"}]<a href="#collapseMedia" class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#product-panels" aria-expanded="false">[{$oViewConf->getRoxidIcon('media')}] [{oxmultilang ident="MEDIA"}]</a>[{/capture}]
        [{capture append="panelsContent"}]
            <div id="collapseMedia" class="panel-collapse collapse z-media">
                <div class="panel-body">
                    [{include file="page/details/inc/media.tpl"}]
                </div>
            </div>
        [{/capture}]
    [{/if}]
[{/block}]

[{if $oView->isReviewActive() }]
    [{block name="details_tabs_reviews"}]
        [{capture assign="review_code"}]
            [{assign var="product" value=$oView->getProduct()}]
            [{if $oxcmp_user}]
                [{assign var="force_sid" value=$oView->getSidForWidget()}]
            [{/if}]
            [{oxid_include_widget cl="oxwReview" nocookie=1 force_sid=$force_sid _parent=$oViewConf->getTopActiveClassName() type=oxarticle anid=$product->oxarticles__oxnid->value aid=$product->oxarticles__oxid->value canrate=$oView->canRate() skipESIforUser=1}]
        [{/capture}]

        [{if $oViewConf->getViewThemeParam('blShowReviewTab')}]
            [{capture append="tabs"}]<a href="#review" data-toggle="tab">[{$oViewConf->getRoxidIcon('write_review')}] [{oxmultilang ident="PAGE_DETAILS_TABS_REVIEW"}]</a>[{/capture}]
            [{capture append="tabsContent"}]
                <div id="review" class="z-review tab-pane">
                    [{$review_code}]
                </div>
            [{/capture}]
        [{/if}]

        [{if $oView->getReviews()}]
            [{capture append="panels"}]
                <a href="#collapseReviews" class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#product-panels" aria-expanded="false">[{$oViewConf->getRoxidIcon('write_review')}] [{oxmultilang ident="PAGE_DETAILS_TABS_REVIEW"}]</a>
            [{/capture}]
            [{capture append="panelsContent"}]
                <div id="collapseReviews" class="panel-collapse collapse">
                    <div class="panel-body">
                        [{$review_code}]
                    </div>
                </div>
            [{/capture}]
        [{/if}]
    [{/block}]
[{/if}]

[{block name="details_tabs_fbcomments"}]
    [{if $oView->isActive('FbComments') && $oViewConf->getFbAppId()}]
        [{capture append="FBtabs"}]<a href="#productFbComments" data-toggle="tab">[{$oViewConf->getRoxidIcon('facebook')}] [{oxmultilang ident="FACEBOOK_COMMENTS"}]</a>[{/capture}]
        [{assign var='_fbScript' value="http://connect.facebook.net/en_US/all.js#appId="|cat:$oViewConf->getFbAppId()|cat:"&amp;xfbml=1"}]
        [{capture append="FBtabsContent"}]
            <div id="productFbComments" class="tab-pane [{if !$fbFirstTabContentPrinted}]active[{/if}]">
                [{include file="widget/facebook/enable.tpl" source="widget/facebook/comments.tpl" ident="#productFbComments" script=$_fbScript type="text"}]
            </div>
            [{assign var="fbFirstTabContentPrinted" value=true}]
        [{/capture}]
    [{/if}]
[{/block}]

[{block name="details_tabs_fbinvite"}]
    [{if $oView->isActive('FbInvite') && $oViewConf->getFbAppId()}]
        [{capture append="FBtabs"}]<a href="#productFbInvite" data-toggle="tab">[{$oViewConf->getRoxidIcon('facebook')}] [{oxmultilang ident="FACEBOOK_INVITE"}]</a>[{/capture}]
        [{capture append="FBtabsContent"}]
            <div id="productFbInvite" class="tab-pane [{if !$fbFirstTabContentPrinted}]active[{/if}]">
                <fb:serverfbml width="560px" id="productFbInviteFbml">
                    [{include file="widget/facebook/enable.tpl" source="widget/facebook/invite.tpl" ident="#productFbInviteFbml" type="text"}]
                </fb:serverfbml>
            </div>
            [{assign var="fbFirstTabContentPrinted" value=true}]
        [{/capture}]
    [{/if}]
[{/block}]


[{block name="details_tabs_main"}]
    [{if $tabs}]
        <div class="hidden-xs">
            <ul class="z-product-info-tabs nav nav-tabs">
                [{foreach from=$tabs item="tab" name="tabs"}]
                    <li [{if $smarty.foreach.tabs.first}]class="active"[{/if}]>[{$tab}]</li>
                [{/foreach}]
            </ul>
            <div class="tab-content">
                [{foreach from=$tabsContent item="tabContent"}]
                    [{$tabContent}]
                [{/foreach}]
            </div>
        </div>
    [{/if}]

    [{if $panels}]
        <div id="#product-panels" class="panel-group visible-xs">
            [{foreach from=$panels item="panel" name="panels"}]
                [{assign var="index" value=$smarty.foreach.panels.index}]
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            [{$panel}]
                        </h4>
                    </div>
                    [{$panelsContent.$index}]
                </div>
            [{/foreach}]
        </div>
    [{/if}]
[{/block}]



[{block name="details_tabs_facebook"}]
    [{if $FBtabs}]
        <div class="hidden-xs">
            <ul id="itemFbTabs" class="nav nav-tabs">
                [{foreach from=$FBtabs item="FBtab" name="tabs"}]
                    <li class="fbTab [{if $smarty.foreach.tabs.first}]active[{/if}]">[{$FBtab}]</li>
                [{/foreach}]
            </ul>
            <div class="tab-content">
                [{foreach from=$FBtabsContent item="FBtabContent"}]
                    [{$FBtabContent}]
                [{/foreach}]
            </div>
        </div>
    [{/if}]
[{/block}]
