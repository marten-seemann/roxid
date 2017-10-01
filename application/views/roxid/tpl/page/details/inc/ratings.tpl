[{if $oxcmp_user}]
    [{assign var="force_sid" value=$oView->getSidForWidget()}]
[{/if}]
<div class="rating z-rating">
    [{oxid_include_widget cl="oxwRating" blCanRate=$oView->canRate() _parent=$oViewConf->getTopActiveClassName() nocookie=1 force_sid=$force_sid sRateUrl=$oDetailsProduct->getLink() dRatingCount=$oView->getRatingCount() dRatingValue=$oView->getRatingValue() anid=$oDetailsProduct->oxarticles__oxnid->value skipESIforUser=1}]
</div>
