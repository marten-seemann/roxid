[{foreach key=sShipID from=$oView->getAllSets() item=oShippingSet name=ShipSetSelect}]
    <div class="form-horizontal">
        <dl>
            <dt>
                <label class="radio">
                    <input type="radio" name="sShipSet" class="z-shipping-options" value="[{$sShipID}]" [{if $oShippingSet->blSelected}]checked="checked"[{/if}]> [{$oShippingSet->oxdeliveryset__oxtitle->value}]
                </label>
            </dt>
            <dd></dd>
        </dl>
    </div>
[{/foreach}]
[{oxscript add="$('.z-shipping-options').changeShipping();"}]
