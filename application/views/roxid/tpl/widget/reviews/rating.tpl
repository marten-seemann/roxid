[{if !$oxcmp_user}]
    [{assign var="_star_title" value="MESSAGE_LOGIN_TO_RATE"|oxmultilangassign}]
[{elseif !$oView->canRate()}]
    [{assign var="_star_title" value="MESSAGE_ALREADY_RATED"|oxmultilangassign}]
[{else}]
    [{assign var="_star_title" value="MESSAGE_RATE_THIS_ARTICLE"|oxmultilangassign}]
[{/if}]

[{capture name="review_stars" assign="review_stars"}]
    <div class="rateit" data-rateit-value="[{$oView->getRatingValue()}]" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
[{/capture}]

<div class="z-rating-stars">
    [{if $blCanRate}]
        <a class="hidden-xs" rel="nofollow" href="#review" title="[{$_star_title}]">[{$review_stars}]</a>
    [{else}]
        <div class="hidden-xs">[{$review_stars}]</div>
    [{/if}]
    <div class="visible-xs">[{$review_stars}]</div>
</div>
[{oxscript add="$('.rateit').rateit();"}]


<div class="z-rating-value">
    [{assign var="sRateUrl" value=$oView->getRateUrl()}]
    [{assign var="ratingCount" value=$oView->getRatingCount()}]
    [{if $ratingCount}]
        <span>
            [{$ratingCount}]
            [{if $ratingCount == 1}]
                [{oxmultilang ident="RATING"}]
            [{else}]
                [{oxmultilang ident="RATINGS"}]
            [{/if}]
        </span>
    [{else}]
        <span class="hidden-sm">[{oxmultilang ident="NO_RATINGS"}]</span>
        <span class="visible-sm">([{$oView->getRatingCount()}])</span>
    [{/if}]
</div>

<div class="clear"></div>
