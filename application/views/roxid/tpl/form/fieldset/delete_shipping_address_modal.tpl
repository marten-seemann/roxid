[{block name="delete_shipping_address_modal"}]
    [{if $oxcmp_user}]
        [{assign var="userAddresses" value=$oxcmp_user->getUserAddresses()}]
    [{/if}]

    [{foreach from=$userAddresses item=shippingAddress name="shippingAdresses"}]
        <form name="delete_shipping_address_modal_form_[{$shippingAddress->oxaddress__oxid->value}]"
                action="[{$oViewConf->getSelfActionLink()}]"
                method="post">
            <div class="hidden">
                [{$oViewConf->getHiddenSid()}]
                <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
                <input type="hidden" name="fnc" value="deleteShippingAddress">
                <input type="hidden" name="oxaddressid" value="[{$shippingAddress->oxaddress__oxid->value}]">
            </div>
        </form>
    [{/foreach}]
[{/block}]



