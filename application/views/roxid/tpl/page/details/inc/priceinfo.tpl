[{assign var="currency" value=$oView->getActCurrency()}]

[{if !$amountpricePopoverPlacement}]
    [{assign var="amountpricePopoverPlacement" value="bottom"}]
[{/if}]

[{capture name="amountprice_popover" assign="amountprice_popover"}]
    <table class="table table-striped table-condensed">
        <thead>
            <tr>
                <th>[{oxmultilang ident="FROM"}]</th>
                <th>[{oxmultilang ident="PCS"}]</th>
            </tr>
        </thead>
        <tbody>
            [{foreach from=$oDetailsProduct->loadAmountPriceInfo() item=priceItem name=amountPrice}]
                <tr>
                    <td>[{$priceItem->oxprice2article__oxamount->value}]</td>
                    <td>
                        [{if $priceItem->oxprice2article__oxaddperc->value}]
                            [{$priceItem->oxprice2article__oxaddperc->value}] % [{oxmultilang ident="DISCOUNT"}]
                        [{else}]
                            [{$priceItem->fbrutprice}] [{$currency->sign}]
                        [{/if}]
                    </td>
                </tr>
            [{/foreach}]
        </tbody>
    </table>
[{/capture}]

<a href="#" id="priceinfo_[{$oDetailsProduct->oxarticles__oxid->value}]" class="amountprice_popover" data-toggle="popover" data-html="true" data-placement="[{$amountpricePopoverPlacement}]" data-animation="true" data-content='[{$amountprice_popover}]'>[{oxmultilang ident="BLOCK_PRICE" suffix="COLON"}] <i class="fa fa-caret-down"></i></a>

[{oxscript add="
    var options = { };
    if(Modernizr.touch) { options = { trigger: 'click' }; }
    else { options = { trigger: 'hover' }; }
    $('.amountprice_popover').popover(options).on('click', function() { return false; });
"}]
