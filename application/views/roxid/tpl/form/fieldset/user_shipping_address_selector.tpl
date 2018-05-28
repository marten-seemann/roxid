[{if $oxcmp_user }]
    <div class="z-delivery-addresses">
        <div class="radio" style="display:none;">
            <label>
                <input type="radio" name="oxaddressid" value="-1"> [{ oxmultilang ident="NEW_ADDRESS" }]
            </label>
        </div>
        [{foreach from=$oxcmp_user->getUserAddresses() item=address }]
            <div class="row">
                <div class="radio col-sm-14">
                    <label>
                        <input type="radio" name="oxaddressid" value="[{$address->oxaddress__oxid->value}]" [{if $address->isSelected()}]checked="checked"[{/if}]>
                        [{if $address->oxaddress__oxcompany->value}][{$address->oxaddress__oxcompany->value}]<br>[{/if}]
                        <strong>[{$address->oxaddress__oxfname->value}] [{$address->oxaddress__oxlname->value}]</strong><br>
                        [{$address->oxaddress__oxstreet->value}] [{$address->oxaddress__oxstreetnr->value}]<br>
                        [{$address->oxaddress__oxzip->value}] [{$address->oxaddress__oxcity->value}]<br>
                        [{$address->oxaddress__oxcountry->value}]
                    </label>
                </div>
                <div class="col-sm-10">
                    [{if $address->isSelected() && $showChangeButton}]
                        <button id="userChangeShippingAddress" class="btn btn-default btn-sm" name="changeShippingAddress" type="submit" [{if !$oView->showShipAddress() and $oxcmp_user->getSelectedAddress()}] style="display: none;" [{/if}]>[{$oViewConf->getRoxidIcon('edit')}] [{ oxmultilang ident="PAGE_CHECKOUT_BASKET_CHANGE" }]</button>
                    [{/if}]
                </div>
            </div>

        [{/foreach}]
    </div>
[{/if}]
