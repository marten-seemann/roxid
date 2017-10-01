[{if $oxcmp_basket->getProductsCount()}]
    [{oxhasrights ident="TOBASKET"}]
        [{assign var="currency" value=$oView->getActCurrency() }]
        <div class="z-minibasket">
            <table class="z-basket">
                <thead>
                    <th class="z-basket-quantity"></th>
                    <th class="z-basket-thumb"></th>
                    <th class="z-basket-product"></th>
                    [{*<th class="z-basket-unitprice">
                        [{ oxmultilang ident="UNIT_PRICE" }]
                    </th>*}]
                    <th class="z-basket-total">
                        <span class="pull-right">[{ oxmultilang ident="TOTAL_MOBILE" }]</span>
                    </th>
                </thead>
                <tbody>
                    [{foreach from=$oxcmp_basket->getContents() name=miniBasketList item=_product}]
                        [{block name="widget_minibasket_product"}]
                            [{assign var="minibasketItemTitle" value=$_product->getTitle() }]
                            [{assign var="oArticle" value=$_product->getArticle() }]
                            [{assign var="oAttributes" value=$oArticle->getAttributesDisplayableInBasket()}]

                            <tr>
                                <td>
                                    [{$_product->getAmount()}]&times;
                                </td>
                                <td class="z-basket-thumb">
                                    <a href="[{$_product->getLink()}]" rel="nofollow">
                                        <img src="[{$_product->getIconUrl()}]" alt="[{$minibasketItemTitle|strip_tags}]" class="img-responsive">
                                    </a>
                                </td>

                                <td class="z-basket-product">
                                    <div>
                                        <a href="[{$_product->getLink()}]" title="[{ $minibasketItemTitle|strip_tags }]" rel="nofollow">
                                            [{ $minibasketItemTitle|strip_tags }]
                                        </a>
                                        <div class="z-product-artnum">
                                            [{ oxmultilang ident="PRODUCT_NO" suffix="COLON" }] [{ $oArticle->oxarticles__oxartnum->value }]
                                        </div>

                                        [{include file="page/checkout/inc/basket_item_selections.tpl" basketitem=$_product basketproduct=$oArticle}]

                                        <div class="z-pers-param-box">
                                            [{include file="page/checkout/inc/basket_item_persparam.tpl" editable=false basketitem=$_product basketproduct=$oArticle}]
                                        </div>
                                    </div>
                                </td>

                                [{*
                                <td class="z-basket-unitprice">
                                    [{if $_product->getUnitPrice() }]
                                        [{oxprice price=$_product->getUnitPrice() currency=$currency }][{if $oView->isVatIncluded() }]<span class="z-vat-included">*</span>[{/if}]
                                    [{/if}]

                                    [{if !$_product->isBundle() }]
                                        [{assign var=dRegUnitPrice value=$_product->getRegularUnitPrice()}]
                                        [{assign var=dUnitPrice value=$_product->getUnitPrice()}]
                                        [{if $dRegUnitPrice && $dUnitPrice && $dRegUnitPrice->getPrice() > $dUnitPrice->getPrice() }]
                                            <div class="z-oldprice">
                                                <del>[{oxprice price=$_product->getRegularUnitPrice() currency=$currency }]</del>
                                            </div>
                                        [{/if}]
                                    [{/if}]
                                </td>
                                *}]

                                <td class="z-basket-total">
                                    [{oxprice price=$_product->getPrice() currency=$currency}][{if $oView->isVatIncluded() }]<span class="z-vat-included">*</span>[{/if}]
                                </td>
                            </tr>
                        [{/block}]
                    [{/foreach}]
                </tbody>
            </table>

            [{block name="widget_minibasket_total"}]
                <div class="z-basket-summary">
                    <table>
                        <tbody>
                            <tr class="z-basket-summary-total">
                                <th>[{ oxmultilang ident="TOTAL" suffix="COLON" }]</th>
                                <td>
                                    [{if $oxcmp_basket->isPriceViewModeNetto()}]
                                        [{ $oxcmp_basket->getProductsNetPrice()}]
                                    [{else}]
                                        [{ $oxcmp_basket->getFProductsPrice()}]
                                    [{/if}]
                                    [{ $currency->sign}][{if $oView->isVatIncluded() }]<span class="z-vat-included">*</span>[{/if}]
                                </td>
                            </tr>
                       </tbody>
                    </table>
                </div>
                <div class="clear"></div>
            [{/block}]
        </div>
        [{include file="widget/minibasket/countdown.tpl"}]
    [{/oxhasrights}]
[{/if}]
