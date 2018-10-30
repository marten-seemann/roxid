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

    <button id="delete-shipping-address-button" class="btn btn-danger btn-sm pull-right delete-shipping-address-button" title="[{oxmultilang ident="DELETE_SHIPPING_ADDRESS"}]"><i class="fa fa-trash"></i> [{oxmultilang ident="DELETE_SHIPPING_ADDRESS"}]</button>
    [{capture assign="deleteaddrjs"}]
        var deleteButton = $("#delete-shipping-address-button");
        var activeAddressId = $("input[name=oxaddressid]:checked").val();

        if($(".z-delivery-addresses input[type=radio]:visible").length == 0) {
            deleteButton.hide();
        }
        
        deleteButton.bind("click", function(ev) {
            ev.preventDefault();
            bootbox.confirm({
                message: "[{oxmultilang ident="DELETE_SHIPPING_ADDRESS_CONFIRMATION"}]",
                buttons: {
                    confirm: {
                        label: '[{oxmultilang ident="DELETE_SHIPPING_ADDRESS"}]',
                        className: 'btn-danger'
                    },
                    cancel: {
                        label: '[{oxmultilang ident="CANCEL"}]',
                    }
                },
                callback: function(result) {
                    if(!result) { return; }
                    window.delete_shipping_address_modal_form_[{$delivadr->oxaddress__oxid->value}].submit();
                    return false;
                }
            });
        });
    [{/capture}]

    [{oxscript add=$deleteaddrjs}]
[{/if}]
