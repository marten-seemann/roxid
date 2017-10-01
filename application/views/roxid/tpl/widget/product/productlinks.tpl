<div>
    [{assign var="questionMail" value='DETAILS_QUESTIONS'|oxmultilangassign}]
    [{assign var="questionMail" value=$oViewConf->getRoxidIcon('question-mail')|cat:" "|cat:$questionMail}]
    <div>
        [{mailto extra='id="questionMail" class="btn btn-primary"' address=$oDetailsProduct->oxarticles__oxquestionemail->value|default:$oxcmp_shop->oxshops__oxinfoemail->value subject='DETAILS_QUESTIONSSUBJECT'|oxmultilangassign|cat:" "|cat:$oDetailsProduct->oxarticles__oxartnum->value text=$questionMail }]
    </div>
    [{if $oxcmp_user }]
        [{if $oViewConf->getShowListmania() || $oViewConf->getShowWishlist() }]
            <div class="dropdown">
                <a href="#" class="dropdown-toggle btn btn-default" data-toggle="dropdown">[{ oxmultilang ident="DETAILS_MORE_ACTIONS" }] <i class="fa fa-caret-down"></i></a>
                <ul class="dropdown-menu">
                    [{if $oViewConf->getShowListmania()}]
                        <li><a id="recommList" rel="nofollow" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=recommadd" params="aid=`$oDetailsProduct->oxarticles__oxnid->value`&amp;anid=`$oDetailsProduct->oxarticles__oxnid->value`"|cat:$oViewConf->getNavUrlParams() }]">[{$oViewConf->getRoxidIcon('listmania')}] [{ oxmultilang ident="ADD_TO_LISTMANIA_LIST" }]</a></li>
                    [{/if}]
                    <li><a id="linkToNoticeList" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getTopActiveClassName() params="aid=`$oDetailsProduct->oxarticles__oxnid->value`&amp;anid=`$oDetailsProduct->oxarticles__oxnid->value`&amp;fnc=tonoticelist&amp;am=1"|cat:$oViewConf->getNavUrlParams()|cat:"&amp;stoken="|cat:$oViewConf->getSessionChallengeToken() }]" rel="nofollow">[{$oViewConf->getRoxidIcon('wishlist')}] [{ oxmultilang ident="ADD_TO_WISH_LIST" }]</a></li>
                    [{if $oViewConf->getShowWishlist()}]
                        <li><a id="linkToWishList" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getTopActiveClassName() params="aid=`$oDetailsProduct->oxarticles__oxnid->value`&anid=`$oDetailsProduct->oxarticles__oxnid->value`&amp;fnc=towishlist&amp;am=1"|cat:$oViewConf->getNavUrlParams()|cat:"&amp;stoken="|cat:$oViewConf->getSessionChallengeToken() }]" rel="nofollow">[{$oViewConf->getRoxidIcon('gift_registry')}] [{ oxmultilang ident="ADD_TO_GIFT_REGISTRY" }]</a></li>
                    [{/if}]
                </ul>
            </div>
        [{else}]
            <a id="linkToNoticeList" class="btn btn-default btn-sm" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getTopActiveClassName() params="aid=`$oDetailsProduct->oxarticles__oxnid->value`&amp;anid=`$oDetailsProduct->oxarticles__oxnid->value`&amp;fnc=tonoticelist&amp;am=1"|cat:$oViewConf->getNavUrlParams()|cat:"&amp;stoken="|cat:$oViewConf->getSessionChallengeToken() }]" rel="nofollow">[{$oViewConf->getRoxidIcon('wishlist')}] [{ oxmultilang ident="PAGE_DETAILS_ADDTONOTICELIST" }]</a>
        [{/if}]
    [{/if}]
</div>

<div>
    [{if $oViewConf->getShowCompareList() }]
        <div class="hidden-xs">
            [{oxid_include_dynamic file="page/details/inc/compare_links.tpl" testid="" type="compare" aid=$oDetailsProduct->oxarticles__oxid->value anid=$oDetailsProduct->oxarticles__oxnid->value in_list=$oDetailsProduct->isOnComparisonList() page=$oView->getActPage() text_to_id="COMPARE" text_from_id="REMOVE_FROM_COMPARE_LIST"}]
        </div>
    [{/if}]
    [{capture name="suggest_button" assign="suggest_button"}]
        <a id="suggest" class="btn btn-default btn-sm" rel="nofollow" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=suggest" params="anid=`$oDetailsProduct->oxarticles__oxnid->value`"|cat:$oViewConf->getNavUrlParams() }]">[{$oViewConf->getRoxidIcon('product_recommend')}] [{ oxmultilang ident="RECOMMEND" }]</a>
    [{/capture}]

    <div class="hidden-xs">
        [{$suggest_button}]
    </div>
</div>
