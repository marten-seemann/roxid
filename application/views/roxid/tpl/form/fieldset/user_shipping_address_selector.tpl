[{if $oxcmp_user }]
<div class="z-delivery-addresses">
    [{foreach from=$oxcmp_user->getUserAddresses() item=address }]
        <div class="z-delivery-address panel [{if $address->isSelected()}]selected[{/if}]">
            <div class="panel-heading">
                <input type="radio" name="oxaddressid" value="[{$address->oxaddress__oxid->value}]" [{if $address->isSelected()}]checked="checked"[{/if}]> [{ oxmultilang ident="CHOOSE_DELIVERY" }]
                [{if $address->isSelected() && $showChangeButton}]
                    <div class="z-delivery-address-actions pull-right">
                        <button id="editShippingAddress" class="btn btn-default btn-sm" name="changeShippingAddress">
                            [{$oViewConf->getRoxidIcon('edit')}]
                        </button>
                        <button id="delete-shipping-address-button" class="btn btn-danger btn-sm delete-shipping-address-button" title="[{oxmultilang ident="DELETE_SHIPPING_ADDRESS"}]">
                            <i class="fa fa-trash"></i>
                        </button>
                    </div>
                [{/if}]
            </div>
            <div class="panel-body">
                [{if $address->oxaddress__oxcompany->value}][{$address->oxaddress__oxcompany->value}]<br>[{/if}]
                <strong>[{$address->oxaddress__oxfname->value}] [{$address->oxaddress__oxlname->value}]</strong><br>
                [{$address->oxaddress__oxstreet->value}] [{$address->oxaddress__oxstreetnr->value}]<br>
                [{$address->oxaddress__oxzip->value}] [{$address->oxaddress__oxcity->value}]<br>
                [{$address->oxaddress__oxcountry->value}]<br>
            </div>
        </div>
    [{/foreach}]

    [{capture assign="deleteaddrjs"}]
        var deleteButton = $("#delete-shipping-address-button");
        var activeAddressId = $("input[name=oxaddressid]:checked").val();

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
</div>
<div class="z-new-delivery-address">
    <input type="radio" name="oxaddressid" value="-1" style="display:none;"> 
    <button id="newAddress" class="btn btn-default">[{ oxmultilang ident="NEW_ADDRESS" }]</button>
</div>
[{/if}]
