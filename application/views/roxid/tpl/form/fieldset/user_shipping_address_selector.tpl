[{if $oxcmp_user }]
<div class="z-delivery-addresses">
    [{foreach from=$oxcmp_user->getUserAddresses() item=address }]
        <div>
            <div class="z-delivery-address panel [{if $address->isSelected()}]selected[{/if}]">
                <div class="panel-heading">
                    <input type="radio" name="oxaddressid" value="[{$address->oxaddress__oxid->value}]" [{if $address->isSelected()}]checked="checked"[{/if}]> [{ oxmultilang ident="CHOOSE_DELIVERY" }]
                    [{if $address->isSelected() && $showChangeButton}]
                        <div class="z-delivery-address-actions pull-right">
                            <button id="editShippingAddress" class="btn btn-default btn-sm" name="changeShippingAddress">
                                [{$oViewConf->getRoxidIcon('edit')}]
                            </button>
                            <button id="delete-shipping-address-button" class="btn btn-danger btn-sm delete-shipping-address-button" data-oxaddressid="[{$address->oxaddress__oxid->value}]" title="[{oxmultilang ident="DELETE_SHIPPING_ADDRESS"}]">
                                <i class="fa fa-trash"></i>
                            </button>
                        </div>
                    [{/if}]
                </div>
                <div class="panel-body">
                    [{include file="widget/address/shipping_address.tpl" delivadr=$address}]
                </div>
            </div>
        </div>
    [{/foreach}]
</div>
<div class="z-new-delivery-address">
    <input type="radio" name="oxaddressid" value="-1" style="display:none;"> 
    <button id="newAddress" class="btn btn-default" [{if $oxcmp_user->getUserAddresses()|count == 0}]style="display:none;"[{/if}]>[{ oxmultilang ident="NEW_ADDRESS" }]</button>
</div>
[{/if}]
