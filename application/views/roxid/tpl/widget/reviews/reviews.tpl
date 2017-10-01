[{oxscript add="$( '.writeNewReview' ).oxReview();"}]
<div class="z-review">
    [{block name="widget_reviews_form"}]
        <div class="hidden-xs">
            [{if $oxcmp_user}]
                <form action="[{$oViewConf->getSelfActionLink()}]" method="post">
                    <div class="writeReview" style="display:none;">
                        [{if $oView->canRate()}]
                            <input id="productRating" type="hidden" name="artrating" value="0">
                            <input id="recommListRating" type="hidden" name="recommlistrating" value="0">

                            <input type="range" min="0" max="5" value="0" step="1" id="backing2">
                            <div id="review-rating" class="rateit" data-rateit-backingfld="#backing2"  data-rateit-resetable="false"></div>
                            [{oxscript add="
                                $('#review-rating').bind('rated', function (event, value) { $('#productRating, #recommListRating').val(value); });
                            "}]
                            <div class="clear"></div>
                        [{/if}]
                        [{$oViewConf->getHiddenSid()}]
                        [{$oViewConf->getNavFormParams()}]
                        [{oxid_include_dynamic file="form/formparams.tpl"}]
                        <input type="hidden" name="fnc" value="savereview">
                        <input type="hidden" name="cl" value="[{$oViewConf->getTopActiveClassName()}]">
                        [{if $oView->getReviewType() == 'oxarticle'}]
                            <input type="hidden" name="anid" value="[{$oView->getArticleId()}]">
                        [{elseif $oView->getReviewType() == 'oxrecommlist'}]
                            <input type="hidden" name="recommid" value="[{$oView->getRecommListId()}]">
                        [{/if}]

                        [{assign var="sReviewUserHash" value=$oView->getReviewUserHash()}]
                        [{if $sReviewUserHash}]
                            <input type="hidden" name="reviewuserhash" value="[{$sReviewUserHash}]">
                        [{/if}]

                        <textarea rows="[{if $mobiledetails}]5[{else}]12[{/if}]" name="rvw_txt" class="form-control"></textarea><br>
                        <button type="submit" class="btn btn-primary">[{$oViewConf->getRoxidIcon('save')}] [{oxmultilang ident="SAVE"}]</button>
                    </div>
                </form>
                <a rel="nofollow" class="writeNewReview btn btn-default">[{$oViewConf->getRoxidIcon('write_review')}] [{oxmultilang ident="WRITE_REVIEW"}]</a>
            [{else}]
                [{assign var="sArticleNId" value=$oView->getArticleNId()}]
                <a rel="nofollow" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" params="anid=$sArticleNId"|cat:"&amp;sourcecl="|cat:$oViewConf->getTopActiveClassName()|cat:$oViewConf->getNavUrlParams()}]"><b>[{oxmultilang ident="MESSAGE_LOGIN_TO_WRITE_REVIEW"}]</b></a>
            [{/if}]
        </div>
    [{/block}]


    [{assign var="aReviews" value=$oView->getReviews()}]
    [{if $aReviews}]
        [{foreach from=$aReviews item=review name=ReviewsCounter}]
            <dl>
                [{block name="widget_reviews_record"}]
                    <dt class="clear item">
                        <span>
                            <span>[{$review->oxuser__oxfname->value}]</span> [{oxmultilang ident="WRITES" suffix="COLON"}]
                            <span class="z-review-date">[{$review->oxreviews__oxcreate->value|date_format:"%d.%m.%Y"}]</span>
                        </span>
                        [{if $review->oxreviews__oxrating->value}]
                            <div class="rateit" data-rateit-value="[{$review->oxreviews__oxrating->value}]" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
                            <span title="[{$iRatingAverage}]"></span>
                        [{/if}]
                    </dt>
                    <dd>
                        <blockquote class="description">[{$review->oxreviews__oxtext->value}]</blockquote>
                    </dd>
                [{/block}]
            </dl>
        [{/foreach}]
    [{else}]
        <dl>
            <dt>
                [{oxmultilang ident="NO_REVIEW_AVAILABLE"}]
            </dt>
            <dd></dd>
        </dl>
    [{/if}]
</div>
[{oxscript widget=$oView->getClassName()}]
