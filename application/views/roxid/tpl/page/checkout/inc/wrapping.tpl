<div id="wrapping-modal" class="z-wrapping modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form name="basket" action="[{ $oViewConf->getSelfActionLink() }]" method="post">
                [{ $oViewConf->getHiddenSid() }]
                <input type="hidden" name="cl" value="basket">
                <input type="hidden" name="fnc" value="changewrapping">
                [{ assign var="oWrapList" value=$oView->getWrappingList() }]

                [{assign var="currency" value=$oView->getActCurrency() }]
                [{block name="checkout_wrapping_header"}]
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h3 class="modal-title">[{oxmultilang ident="GIFT_OPTION"}]</h3>
                    </div>
                [{/block}]

                <div class="modal-body">
                    <p>[{oxmultilang ident="WRAPPING_DESCRIPTION"}]</p>

                    [{block name="checkout_wrapping_contents"}]
                        <fieldset>
                            <legend>[{ oxmultilang ident="ADD_WRAPPING" }]</legend>

                            [{if !$oxcmp_basket->getProductsCount()}]
                                <div>[{ oxmultilang ident="BASKET_EMPTY" }]</div>
                            [{else}]
                                [{if $oWrapList->count() }]
                                    [{* basket items *}]
                                    [{assign var="icounter" value="0"}]
                                    <table class="z-wrapping-data">
                                        <colgroup>
                                            <col class="z-wrapping-thumb">
                                            <col class="z-wrapping-desc">
                                            <col class="z-wrapping-price">
                                        </colgroup>
                                        [{assign var="basketitemlist" value=$oView->getBasketArticles()}]
                                        [{foreach key=basketindex from=$oxcmp_basket->getContents() item=basketitem name=wrappArt}]
                                            [{block name="checkout_wrapping_item"}]
                                                [{assign var="basketproduct" value=$basketitemlist.$basketindex }]
                                                <tr>
                                                    <td class="z-wrapping-thumb">
                                                        <a rel="nofollow" class="visible-xs" href="[{$basketitem->getLink()}]">[{$basketitem->getTitle()}]</a>
                                                        <a href="[{$basketitem->getLink()}]">
                                                            <img src="[{$basketproduct->getThumbnailUrl() }]" alt="[{$basketitem->getTitle()|strip_tags}]" class="img-responsive">
                                                        </a>
                                                    </td>
                                                    <td class="z-wrapping-desc hidden-xs">
                                                        <a rel="nofollow" href="[{$basketitem->getLink()}]">[{$basketitem->getTitle()}]</a>
                                                    </td>
                                                    <td class="z-wrapping-price">
                                                        <ul class="list-unstyled">
                                                            <li>
                                                                <input class="radiobox" type="radio" name="wrapping[[{$basketindex}]]" value="0" [{ if !$basketitem->getWrappingId()}]CHECKED[{/if}]>
                                                                <label for="wrapping_[{$basketindex}]">[{ oxmultilang ident="NONE" }]</label>
                                                                <span class="z-wrapping-price">[{oxprice price=0 currency=$currency}]</span>
                                                            </li>
                                                            [{assign var="ictr" value="1"}]
                                                            [{foreach from=$oView->getWrappingList() item=wrapping name=Wraps}]
                                                                <li>
                                                                    <input class="radiobox" type="radio" name="wrapping[[{$basketindex}]]" value="[{$wrapping->oxwrapping__oxid->value}]" [{ if $basketitem->getWrappingId() == $wrapping->oxwrapping__oxid->value}]CHECKED[{/if}]>
                                                                    [{if $wrapping->oxwrapping__oxpic->value }]
                                                                        <img src="[{$wrapping->getPictureUrl()}]" alt="[{$wrapping->oxwrapping__oxname->value}]">
                                                                        <div class="clear visible-xs"></div>
                                                                    [{/if}]
                                                                    <label for="wrapping_[{$wrapping->oxwrapping__oxid->value}]">[{$wrapping->oxwrapping__oxname->value}]</label>
                                                                    <span class="z-wrapping-price">[{oxprice price=$wrapping->getPrice() currency=$currency}]</span>
                                                                </li>
                                                                [{assign var="ictr" value="`$ictr+1`"}]
                                                            [{/foreach}]
                                                            [{oxscript add="$( '#wrapp_`$smarty.foreach.wrappArt.iteration` img' ).click(function(){ $(this).parent().parent().find('input').click(); });"}]
                                                        </ul>

                                                    </td>
                                                </tr>
                                                [{assign var="icounter" value="`$icounter+1`"}]
                                            [{/block}]
                                        [{/foreach}]
                                    </table>
                                [{/if}]
                            [{/if}]
                        </fieldset>

                        [{if $oxcmp_basket->getProductsCount()}]
                            [{assign var="oCardList" value=$oView->getCardList()}]
                            [{if $oCardList->count()}]
                                <fieldset>
                                    <legend>[{ oxmultilang ident="GREETING_CARD" }]</legend>
                                    [{block name="checkout_wrapping_cards"}]
                                        <ul class="z-wrapping-card list-unstyled" id="wrappCard">
                                            <li>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" class="radiobox" name="chosencard" id="chosencard" value="0" [{ if !$oxcmp_basket->getCardId() }]CHECKED[{/if}]>
                                                        [{ oxmultilang ident="NO_GREETING_CARD" }]
                                                    </label>
                                                </div>
                                            </li>
                                        [{assign var="icounter" value="0"}]
                                        [{counter start=0 print=false}]
                                        [{assign var="icounter" value="0"}]
                                        [{foreach from=$oCardList item=card name=GreetCards}]
                                            <li>
                                                <div class="radio">
                                                    <label>
                                                        <input class="radiobox" type="radio" name="chosencard" id="chosen_[{$card->oxwrapping__oxid->value}]" value="[{$card->oxwrapping__oxid->value}]" [{ if $oxcmp_basket->getCardId() == $card->oxwrapping__oxid->value}]CHECKED[{/if}]>
                                                        [{$card->oxwrapping__oxname->value}] <strong>[{oxprice price=$card->getPrice() currency=$currency}]</strong>
                                                    </label>
                                                </div>
                                                [{if $card->oxwrapping__oxpic->value}]
                                                    <img src="[{$card->getPictureUrl()}]" alt="[{$card->oxwrapping__oxname->value}]">
                                                [{/if}]
                                            </li>
                                        [{assign var="icounter" value="`$icounter+1`"}]
                                        [{/foreach}]
                                        [{oxscript add="$( '#wrappCard img' ).click(function(){ $(this).parent().find('input').click(); });"}]
                                        </ul>
                                        <div class="clear"></div>
                                    [{/block}]
                                    [{block name="checkout_wrapping_comment"}]
                                        <div class="z-wrapping-comment wrappingComment">
                                            <div class="form-group">
                                                <label class="control-label col-sm-5 col-md-4">[{ oxmultilang ident="GREETING_MESSAGE" suffix="COLON"}]</label>
                                                <div class="col-sm-19 col-md-20">
                                                    <textarea rows="5" name="giftmessage" class="form-control">[{$oxcmp_basket->getCardMessage()}]</textarea>
                                                </div>
                                            </div>
                                        </div>
                                    [{/block}]
                                </fieldset>
                            [{/if}]
                        [{/if}]
                    [{/block}]
                </div>
                [{block name="checkout_wrapping_submit"}]
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">[{ oxmultilang ident="APPLY" }]</button>
                        <button class="btn btn-default">[{ oxmultilang ident="CANCEL" }]</button>
                    </div>
                [{/block}]
            </form>
        </div>
    </div>
</div>
