[{assign var="currency" value=$oView->getActCurrency()}]
[{assign var="showControls" value=false}]

<form name="basket[{ $basketindex }]" action="[{ $oViewConf->getSelfActionLink() }]" method="post">
    [{ $oViewConf->getHiddenSid() }]
    <input type="hidden" name="cl" value="basket">
    <input type="hidden" name="fnc" value="changebasket">
    <input type="hidden" name="CustomError" value='basket'>
    [{* count number of columns that the basket table will have *}]
    [{ assign var="basket_num_columns" value=8}]
    [{ if !$editable }] [{ assign var="basket_num_columns" value=7}] [{/if}]
    [{ if !$oView->isWrapping() }] [{ assign var="basket_num_columns" value=7}] [{/if}]
    [{ if !$editable && !$oView->isWrapping() }] [{ assign var="basket_num_columns" value=6}] [{/if}]
    <table id="basket" class="z-basket basketitems[{if $oViewConf->getActiveClassName() == 'order' }] orderBasketItems[{/if}]">
        <colgroup>
            [{if $editable AND $showControls}]<col class="editCol z-basket-checkbox">[{/if}]
            <col class="z-basket-thumb">
            <col class="z-basket-product">
            <col class="z-basket-quantity">
            <col class="z-basket-unitprice">
            <col class="z-basket-vat">
            <col class="z-basket-total">
        </colgroup>
        [{* basket header *}]
        <thead>
            <tr>
                [{if $editable AND $showControls}]<th class="z-basket-checkbox"></th>[{/if}]
                <th class="z-basket-thumb"></th>
                <th class="z-basket-product">[{ oxmultilang ident="PRODUCT" }]</th>
                <th class="z-basket-quantity">[{ oxmultilang ident="QUANTITY" }]</th>
                <th class="z-basket-unitprice">[{ oxmultilang ident="UNIT_PRICE" }]</th>
                <th class="z-basket-vat">[{ oxmultilang ident="VAT" }]</th>
                <th class="z-basket-total">
                    <span class="hidden-xs hidden-sm pull-right">[{ oxmultilang ident="TOTAL" }]</span>
                    <span class="visible-xs visible-sm pull-right">[{ oxmultilang ident="TOTAL_MOBILE" }]</span>
                </th>
            </tr>
        </thead>

        [{* basket items *}]
        <tbody>
        [{assign var="basketitemlist" value=$oView->getBasketArticles() }]
        [{assign var="oMarkGenerator" value=$oView->getBasketContentMarkGenerator() }]
        [{foreach key=basketindex from=$oxcmp_basket->getContents() item=basketitem name=basketContents}]
            [{block name="checkout_basketcontents_basketitem"}]
                [{assign var="basketproduct" value=$basketitemlist.$basketindex }]
                [{assign var="oArticle" value=$basketitem->getArticle()}]
                [{assign var="oAttributes" value=$oArticle->getAttributesDisplayableInBasket()}]

                <tr id="cartItem_[{$smarty.foreach.basketContents.iteration}]">
                    [{block name="checkout_basketcontents_basketitem_removecheckbox"}]
                        [{if $editable AND $showControls }]
                            <td class="z-basket-checkbox checkbox">
                                <input type="checkbox" name="aproducts[[{ $basketindex }]][remove]" value="1">
                            </td>
                        [{/if}]
                    [{/block}]

                    [{block name="checkout_basketcontents_basketitem_image"}]
                        [{* product image *}]
                        <td class="z-basket-thumb">
                            <a href="[{$basketitem->getLink()}]" rel="nofollow">
                                <img src="[{$basketitem->getThumbnailUrl()}]" alt="[{$basketitem->getTitle()|strip_tags}]" class="img-responsive">
                            </a>
                        </td>
                    [{/block}]

                    [{block name="checkout_basketcontents_basketitem_titlenumber"}]
                        [{* product title & number *}]
                        <td class="z-basket-product">
                            <div class="z-product-title">
                                <h4>
                                    <a rel="nofollow" href="[{$basketitem->getLink()}]">[{$oArticle->oxarticles__oxtitle->value}]</a>
                                </h4>

                                [{if $basketitem->isSkipDiscount() }] <sup><a rel="nofollow" href="#noteWithSkippedDiscount" >[{$oMarkGenerator->getMark('skippedDiscount')}]</a></sup>[{/if}]
                                [{if $oViewConf->getActiveClassName() == 'order' && $oViewConf->isFunctionalityEnabled('blEnableIntangibleProdAgreement')}]
                                    [{if $oArticle->hasDownloadableAgreement() }] <sup><a rel="nofollow" href="#noteForDownloadableArticles" >[{$oMarkGenerator->getMark('downloadable')}]</a></sup>[{/if}]
                                    [{if $oArticle->hasIntangibleAgreement() }] <sup><a rel="nofollow" href="#noteForIntangibleArticles" >[{$oMarkGenerator->getMark('intangible')}]</a></sup>[{/if}]
                                [{/if}]
                                <div class="clear"></div>
                            </div>
                            <div class="z-product-artnum">
                                [{ oxmultilang ident="PRODUCT_NO" suffix="COLON" }] [{ $basketproduct->oxarticles__oxartnum->value }]
                            </div>
                            <div class="z-product-attributes">
                                [{assign var=sep value=", "}]
                                [{assign var=result value=""}]
                                [{foreach key=oArtAttributes from=$oAttributes->getArray() item=oAttr name=attributeContents}]
                                    [{assign var=temp value=$oAttr->oxattribute__oxvalue->value}]
                                    [{assign var=result value=$result$temp$sep}]
                                [{/foreach}]
                                [{$result|trim:$sep}]
                            </div>

                            [{include file="page/checkout/inc/basket_item_selections.tpl" basketitem=$basketitem basketproduct=$basketproduct}]

                            [{block name="checkout_basketcontents_basketitem_persparam"}]
                                [{include file="page/checkout/inc/basket_item_persparam.tpl" editable=$editable basketitem=$basketitem basketproduct=$basketproduct}]
                            [{/block}]

                            [{if $oView->isWrapping() }]
                                [{ if $basketitem->getWrappingId() }]
                                    <div class="z-product-wrapping">
                                        [{assign var="oWrap" value=$basketitem->getWrapping() }]
                                        [{if $editable }]
                                            <span>[{oxmultilang ident="WRAPPING" suffix="COLON"}]</span>
                                            <a class="" rel="nofollow" href="#wrapping-modal" data-toggle="modal" title="[{ oxmultilang ident="ADD" }]">[{$oWrap->oxwrapping__oxname->value}]</a>
                                        [{else}]
                                            [{$oWrap->oxwrapping__oxname->value}]
                                        [{/if}]
                                    </div>
                                [{/if}]
                            [{/if}]

                            [{block name="checkout_basketcontents_itemerror"}]
                                [{foreach from=$Errors.basket item=oEr key=key }]
                                    [{if $oEr->getErrorClassType() == 'oxOutOfStockException'}]
                                        [{* display only the exceptions for the current article *}]
                                        [{if $basketindex == $oEr->getValue('basketIndex') }]
                                            <div class="alert alert-danger">[{ $oEr->getOxMessage() }] <strong>[{ $oEr->getValue('remainingAmount') }]</strong></div>
                                        [{/if}]
                                    [{/if}]
                                    [{if $oEr->getErrorClassType() == 'oxArticleInputException'}]
                                        [{if $basketitem->getProductId() == $oEr->getValue('productId') }]
                                            <div class="alert alert-danger">[{ $oEr->getOxMessage() }]</div>
                                        [{/if}]
                                    [{/if}]
                                [{/foreach}]
                            [{/block}]
                        </td>
                    [{/block}]

                    [{block name="checkout_basketcontents_basketitem_quantity"}]
                        [{* product quantity manager *}]
                        <td class="z-basket-quantity">
                            [{if $editable }]
                                <input type="hidden" name="aproducts[[{ $basketindex }]][aid]" value="[{ $basketitem->getProductId() }]">
                                <input type="hidden" name="aproducts[[{ $basketindex }]][basketitemid]" value="[{ $basketindex }]">
                                <input type="hidden" name="aproducts[[{ $basketindex }]][override]" value="1">
                                [{if $basketitem->isBundle() }]
                                    <input type="hidden" name="aproducts[[{ $basketindex }]][bundle]" value="1">
                                [{/if}]

                                [{if !$basketitem->isBundle() || !$basketitem->isDiscountArticle()}]
                                    <div class="z-quantity">
                                        <div class="input-group">
                                            <span class="input-group-btn">
                                                <button class="btn btn-default" type="button" value="minus"><i class="fa fa-minus"></i></button>
                                            </span>
                                            <input id="am_[{$smarty.foreach.basketContents.iteration}]" type="number" class="form-control" name="aproducts[[{ $basketindex }]][am]" value="[{ $basketitem->getAmount() }]" size="2">
                                            <span class="input-group-btn">
                                                <button class="btn btn-default" type="button" value="plus"><i class="fa fa-plus"></i></button>
                                            </span>
                                        </div>
                                    </div>
                                    <button class="btn btn-default z-basket-remove" type="button" title="[{ oxmultilang ident="REMOVE" }]">[{$oViewConf->getRoxidIcon('basket_remove')}]</button>
                                [{/if}]
                            [{else}]
                                [{ $basketitem->getAmount() }]
                            [{/if}]
                            [{if $basketitem->getdBundledAmount() > 0 && ($basketitem->isBundle() || $basketitem->isDiscountArticle()) }]
                                +[{ $basketitem->getdBundledAmount() }]
                            [{/if}]
                        </td>
                    [{/block}]

                    [{block name="checkout_basketcontents_basketitem_unitprice"}]
                        [{* product price *}]
                        <td class="z-basket-unitprice">
                            [{if $basketitem->getUnitPrice() }] [{oxprice price=$basketitem->getUnitPrice() currency=$currency }] [{/if}]
                            [{if !$basketitem->isBundle() }]
                                [{assign var=dRegUnitPrice value=$basketitem->getRegularUnitPrice()}]
                                [{assign var=dUnitPrice value=$basketitem->getUnitPrice()}]
                                [{if $dRegUnitPrice && $dUnitPrice && $dRegUnitPrice->getPrice() > $dUnitPrice->getPrice() }]
                                    <div class="z-oldprice">
                                        <del>[{oxprice price=$basketitem->getRegularUnitPrice() currency=$currency }]</del>
                                    </div>
                                [{/if}]
                            [{/if}]
                        </td>
                    [{/block}]

                    [{block name="checkout_basketcontents_basketitem_vat"}]
                        [{* product VAT percent *}]
                        <td class="z-basket-vat">
                            [{ $basketitem->getVatPercent() }]%
                        </td>
                    [{/block}]

                    [{block name="checkout_basketcontents_basketitem_totalprice"}]
                        [{* product quantity * price *}]
                        <td class="z-basket-total">
                            [{oxprice price=$basketitem->getPrice() currency=$currency}]
                        </td>
                    [{/block}]
                </tr>
            [{/block}]

            [{* packing unit *}]
        [{*  basket items end  *}]
        [{/foreach }]

         [{block name="checkout_basketcontents_giftwrapping"}]
             [{if $oViewConf->getShowGiftWrapping() }]
                  [{assign var="oCard" value=$oxcmp_basket->getCard() }]
                  [{ if $oCard }]
                    <tr>
                        <td class="z-basket-thumb">
                            [{if $oCard->oxwrapping__oxpic->value}]
                                <img src="[{$oCard->getPictureUrl()}]" alt="[{$oCard->oxwrapping__oxname->value}]">
                            [{/if}]
                        </td>
                        <td id="orderCardTitle" colspan="2">[{ oxmultilang ident="GREETING_CARD" }] "[{ $oCard->oxwrapping__oxname->value }]"
                            <div class="z-greetingcard-message">
                                [{if $oxcmp_basket->getCardMessage()}]
                                    <strong>[{ oxmultilang ident="YOUR_MESSAGE" }]</strong>
                                    <blockquote id="orderCardText">
                                        <p>[{ $oxcmp_basket->getCardMessage()|nl2br }]</p>
                                    </blockquote>
                                [{/if}]
                            </div>
                      </td>
                      <td id="orderCardPrice" class="z-basket-unitprice">[{oxprice price=$oCard->getPrice() currency=$currency }]</td>
                      <td class="z-basket-vat">
                         [{if $oxcmp_basket->isProportionalCalculationOn() }]
                            [{ oxmultilang ident="PROPORTIONALLY_CALCULATED" }]</th>
                         [{else}]
                              [{if $oxcmp_basket->getGiftCardCostVat() }][{ $oxcmp_basket->getGiftCardCostVatPercent() }]%[{/if}]
                         [{/if}]
                      </td>
                      <td id="orderCardTotalPrice" class="z-basket-total">[{oxprice price=$oCard->getPrice() currency=$currency}]</td>
                    </tr>
                  [{/if}]
              [{/if}]
          [{/block}]
        </tbody>
        [{if $showControls}]
            [{include file="page/checkout/inc/basket_footer.tpl"}]
        [{/if}]
    </table>

    <div class="clear"></div>
 </form>
