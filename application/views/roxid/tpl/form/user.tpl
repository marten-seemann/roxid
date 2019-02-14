[{block name="user"}]
    <form class="form-horizontal" action="[{ $oViewConf->getSelfActionLink() }]" name="order" method="post" data-toggle="roxid-validator">
        [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
        <div class="row">
            <div class="col-md-16 col-lg-14">
                <div>
                    [{ $oViewConf->getHiddenSid() }]
                    [{ $oViewConf->getNavFormParams() }]
                    <input type="hidden" name="fnc" value="changeuser_testvalues">
                    <input type="hidden" name="cl" value="account_user">
                    <input type="hidden" name="CustomError" value='user'>
                    <input type="hidden" name="blshowshipaddress" value="1">
                </div>
                [{block name="user_billing_address"}]
                    <div class="z-account-billing-address">
                        <fieldset>
                            [{block name="user_billing_address_head"}]
                                <legend>
                                    [{ oxmultilang ident="BILLING_ADDRESS" }]
                                    <button id="userChangeAddress" class="btn btn-default btn-sm" name="changeBillAddress" type="submit" [{if !empty($aErrors)}]style="display: none;"[{/if}]>[{$oViewConf->getRoxidIcon('edit')}] [{ oxmultilang ident="PAGE_CHECKOUT_BASKET_CHANGE" }]</button>
                                </legend>
                            [{/block}]
                            [{block name="user_billing_address_form"}]
                                <div id="addressForm" [{if empty($aErrors)}]style="display: none;"[{/if}]>
                                    [{ include file="form/fieldset/user_email.tpl" }]
                                    [{ include file="form/fieldset/user_billing.tpl" noFormSubmit=true }]
                                </div>
                                [{oxscript add="$('#userChangeAddress').click( function() { $('#addressForm').disableForm(false).show(); $('#addressText').hide();return false;});"}]
                            [{/block}]
                            [{block name="user_billing_address_text"}]
                                <div id="addressText">
                                    [{ include file="widget/address/billing_address.tpl" }]
                                </div>
                            [{/block}]
                        </fieldset>

                    </div>
                [{/block}]
            </div>
        </div>

        <div class="row">
            <div class="col-md-16 col-lg-14">
                [{block name="user_shipping_address"}]
                    <fieldset>
                        [{block name="user_shipping_address_head"}]
                            <legend>
                                [{ oxmultilang ident="SHIPPING_ADDRESSES" }]
                            </legend>
                        [{/block}]
                        [{block name="user_shipping_address_choice"}]
                            [{include file="form/fieldset/user_billing_for_shipping.tpl"}]
                        [{/block}]

                        [{block name="user_shipping_address_form"}]
                            <div id="shippingAddress" [{if !$oView->showShipAddress()}]style="display: none;" [{/if}]>
                                [{ include file="form/fieldset/user_shipping.tpl" noFormSubmit=true showChangeButton=true}]
                            </div>
                            [{if !$oView->showShipAddress() }]
                                [{ oxscript add="$('#shippingAddressForm').disableForm(true);"}]
                            [{/if}]
                            [{oxscript add="$('#showShipAddress').change( function() { var state = $(this).is(':not(:checked)'); $('#userChangeShippingAddress').toggle(state); $('#shippingAddress').disableForm(!state).toggle(state); });"}]
                        [{/block}]
                    </fieldset>
                [{/block}]
            </div>
        </div>
        <button id="accUserSaveTop" class="btn btn-primary" name="userform" type="submit">[{$oViewConf->getRoxidIcon('save')}] [{ oxmultilang ident="SAVE" }]</button>
    </form>
    [{include file="form/fieldset/delete_shipping_address_modal.tpl"}]
[{/block}]
