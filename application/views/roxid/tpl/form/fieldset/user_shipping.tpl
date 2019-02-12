[{if $oxcmp_user}]
    [{assign var="delivadr" value=$oxcmp_user->getSelectedAddress()}]
[{/if}]

<input type="hidden" name="changeClass" value="[{$onChangeClass|default:'account_user'}]">
[{oxscript add="$(document).ready(function() { 
    $(document).zShippingAddress({
        form: $('#shippingAddressForm'),
        editButton: $('#editShippingAddress'),
        selectAddress: $('input[name=oxaddressid]'),
        newAddressButton: $('#newAddress'),
        toggleShipAddress: $('#showShipAddress'),
    }); 
});
"}]
[{block name="form_user_shipping_address_select"}]
    [{include file="form/fieldset/user_shipping_address_selector.tpl" showChangeButton=$showChangeButton}]
[{/block}]

<div id="shippingAddressForm" class="z-new-shipping-address" [{if $delivadr }]style="display: none;"[{/if}]>
    [{block name="form_user_shipping_address_inner"}]
        <div class="form-group">
            <label class="control-label col-sm-8 col-xs-6 radio [{if $oView->isFieldRequired(oxaddress__oxsal)}]req[{/if}]">[{ oxmultilang ident="TITLE" suffix="COLON" }]</label>
            <div class="col-sm-16 col-xs-18">
                [{include file="form/fieldset/salutation.tpl" name="deladr[oxaddress__oxsal]" value=$delivadr->oxaddress__oxsal->value value2=$deladr.oxaddress__oxsal required=$oView->isFieldRequired(oxaddress__oxsal)}]
            </div>
        </div>
        <div class="form-group [{if $aErrors.oxaddress__oxfname}]has-error[{/if}]">
            <label class="control-label col-sm-8 [{if $oView->isFieldRequired(oxaddress__oxfname)}]req[{/if}]">[{ oxmultilang ident="FIRST_NAME" suffix="COLON" }]</label>
            <div class="col-sm-16">
                <input class="form-control" type="text" maxlength="255" name="deladr[oxaddress__oxfname]" value="[{if isset( $deladr.oxaddress__oxfname ) }][{ $deladr.oxaddress__oxfname }][{else}][{ $delivadr->oxaddress__oxfname->value }][{/if }]" [{if $oView->isFieldRequired(oxaddress__oxfname)}]required[{/if}]>
                <div class="help-block with-errors"></div>
            </div>
        </div>
        <div class="form-group [{if $aErrors.oxaddress__oxlname}]has-error[{/if}]">
            <label class="control-label col-sm-8 [{if $oView->isFieldRequired(oxaddress__oxlname)}]req[{/if}]">[{ oxmultilang ident="LAST_NAME" suffix="COLON" }]</label>
            <div class="col-sm-16">
                <input class="form-control" type="text" maxlength="255" name="deladr[oxaddress__oxlname]" value="[{if isset( $deladr.oxaddress__oxlname ) }][{ $deladr.oxaddress__oxlname }][{else}][{ $delivadr->oxaddress__oxlname->value }][{/if }]" [{if $oView->isFieldRequired(oxaddress__oxlname)}]required[{/if}]>
                <div class="help-block with-errors"></div>
            </div>
        </div>
        <div class="form-group [{if $aErrors.oxaddress__oxcompany}]has-error[{/if}]">
            <label class="control-label col-sm-8 [{if $oView->isFieldRequired(oxaddress__oxcompany) }]req[{/if}]">[{ oxmultilang ident="COMPANY" suffix="COLON" }]</label>
            <div class="col-sm-16">
                <input class="form-control" type="text" maxlength="255" name="deladr[oxaddress__oxcompany]" value="[{if isset( $deladr.oxaddress__oxcompany ) }][{ $deladr.oxaddress__oxcompany }][{else}][{ $delivadr->oxaddress__oxcompany->value }][{/if}]" [{if $oView->isFieldRequired(oxaddress__oxcompany) }]required[{/if}]>
                <div class="help-block with-errors"></div>
            </div>
        </div>
        <div class="form-group [{if $aErrors.oxaddress__oxaddinfo}]has-error[{/if}]">
            [{assign var="_address_addinfo_tooltip" value="FORM_FIELDSET_USER_SHIPPING_ADDITIONALINFO2_TOOLTIP"|oxmultilangassign }]
            <label class="control-label col-sm-8 [{if $_address_addinfo_tooltip}]tooltip[{/if}] [{if $oView->isFieldRequired(oxaddress__oxaddinfo) }]req[{/if}]" [{if $_address_addinfo_tooltip}]title="[{$_address_addinfo_tooltip}]"[{/if}] >[{ oxmultilang ident="ADDITIONAL_INFO" suffix="COLON" }]</label>
            <div class="col-sm-16">
                <input class="form-control" type="text" maxlength="255" name="deladr[oxaddress__oxaddinfo]" value="[{if isset( $deladr.oxaddress__oxaddinfo ) }][{ $deladr.oxaddress__oxaddinfo }][{else}][{ $delivadr->oxaddress__oxaddinfo->value }][{/if }]" [{if $oView->isFieldRequired(oxaddress__oxaddinfo) }]required[{/if}]>
                <div class="help-block with-errors"></div>
            </div>
        </div>
        <div class="form-group [{if $aErrors.oxaddress__oxstreet}]has-error[{/if}]">
            <label class="control-label col-sm-8 [{if $oView->isFieldRequired(oxaddress__oxstreet) || $oView->isFieldRequired(oxaddress__oxstreetnr) }]req[{/if}]">[{ oxmultilang ident="STREET_AND_STREETNO" suffix="COLON" }]</label>
            <div class="col-sm-16">
                <div class="row">
                    <div class="col-xs-18">
                        <input class="form-control" type="text" maxlength="255" name="deladr[oxaddress__oxstreet]" value="[{if isset( $deladr.oxaddress__oxstreet ) }][{ $deladr.oxaddress__oxstreet }][{else}][{ $delivadr->oxaddress__oxstreet->value }][{/if }]" [{if $oView->isFieldRequired(oxaddress__oxstreet) }]required[{/if}]>
                    </div>
                    <div class="col-xs-6">
                        <input class="form-control" type="text"  maxlength="16" name="deladr[oxaddress__oxstreetnr]" value="[{if isset( $deladr.oxaddress__oxstreetnr ) }][{ $deladr.oxaddress__oxstreetnr }][{else}][{ $delivadr->oxaddress__oxstreetnr->value }][{/if }]" [{if $oView->isFieldRequired(oxaddress__oxstreetnr) }]required[{/if}]>
                    </div>
                </div>
                <div class="help-block with-errors"></div>
            </div>
        </div>
        <div class="form-group [{if $aErrors.oxaddress__oxzip || $aErrors.oxaddress__oxcity}]has-error[{/if}]">
            <label class="control-label col-sm-8 [{if $oView->isFieldRequired(oxaddress__oxzip) || $oView->isFieldRequired(oxaddress__oxcity) }]req[{/if}]">[{ oxmultilang ident="POSTAL_CODE_AND_CITY" suffix="COLON" }]</label>
            <div class="col-sm-16">
                <div class="row">
                    <div class="col-xs-7">
                        <input class="form-control" type="text" maxlength="50" name="deladr[oxaddress__oxzip]" value="[{if isset( $deladr.oxaddress__oxzip ) }][{ $deladr.oxaddress__oxzip }][{else}][{ $delivadr->oxaddress__oxzip->value }][{/if }]" [{if $oView->isFieldRequired(oxaddress__oxzip) }]required[{/if}]>
                    </div>
                    <div class="col-xs-17">
                        <input class="form-control" type="text" maxlength="255" name="deladr[oxaddress__oxcity]" value="[{if isset( $deladr.oxaddress__oxcity ) }][{ $deladr.oxaddress__oxcity }][{else}][{ $delivadr->oxaddress__oxcity->value }][{/if }]" [{if $oView->isFieldRequired(oxaddress__oxcity) }]required[{/if}]>
                    </div>
                </div>
                <div class="help-block with-errors"></div>
            </div>
        </div>
        [{block name="form_user_shipping_country"}]
            <div class="form-group [{if $aErrors.oxaddress__oxcountryid}]has-error[{/if}]">
                <label class="control-label col-sm-8 [{if $oView->isFieldRequired(oxaddress__oxcountryid) }]req[{/if}]">[{ oxmultilang ident="COUNTRY" suffix="COLON" }]</label>
                <div class="col-sm-16">
                    <select class="form-control" id="delCountrySelect" name="deladr[oxaddress__oxcountryid]" [{if $oView->isFieldRequired(oxaddress__oxcountryid) }]required[{/if}]>
                        <option value="">-</option>
                        [{assign var="aCountryList" value=$oViewConf->getCountryList()}]
                        [{assign var="blCountrySelected" value=false}]
                        [{foreach from=$aCountryList item=country key=country_id }]
                            [{assign var="sCountrySelect" value=""}]
                            [{if !$blCountrySelected}]
                                [{if (isset($deladr.oxaddress__oxcountryid) && $deladr.oxaddress__oxcountryid == $country->oxcountry__oxid->value) ||
                                (!isset($deladr.oxaddress__oxcountryid) && ($delivadr->oxaddress__oxcountry->value == $country->oxcountry__oxtitle->value or
                                    $delivadr->oxaddress__oxcountry->value == $country->oxcountry__oxid->value or
                                    $delivadr->oxaddress__oxcountryid->value == $country->oxcountry__oxid->value)) }]
                                    [{assign var="blCountrySelected" value=true}]
                                    [{assign var="sCountrySelect" value="selected"}]
                                [{/if}]
                            [{/if}]
                            [{if count($aCountryList) == 1}]
                                [{assign var="sCountrySelect" value="selected"}]
                            [{/if}]
                            <option value="[{ $country->oxcountry__oxid->value }]" [{$sCountrySelect}]>[{ $country->oxcountry__oxtitle->value }]</option>
                        [{/foreach }]
                    </select>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            [{*
            <li class="stateBox">
                [{include file="form/fieldset/state.tpl"
                        countrySelectId="delCountrySelect"
                        stateSelectName="deladr[oxaddress__oxstateid]"
                        selectedStateIdPrim=$deladr.oxaddress__oxstateid
                        selectedStateId=$delivadr->oxaddress__oxstateid->value
                }]
            </li>
            *}]
        [{/block}]
        [{if $oViewConf->getViewThemeParam('blShowFon')}]
            <div class="form-group [{if $aErrors.oxaddress__oxfon}]has-error[{/if}]">
                <label class="control-label col-sm-8 [{if $oView->isFieldRequired(oxaddress__oxfon) }]req[{/if}]">[{ oxmultilang ident="PHONE" suffix="COLON" }]</label>
                <div class="col-sm-16">
                    <input class="form-control" type="text" maxlength="128" name="deladr[oxaddress__oxfon]" value="[{if isset( $deladr.oxaddress__oxfon ) }][{ $deladr.oxaddress__oxfon }][{else}][{ $delivadr->oxaddress__oxfon->value }][{/if }]" [{if $oView->isFieldRequired(oxaddress__oxfon) }]required[{/if}]>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
        [{/if}]
        [{if $oViewConf->getViewThemeParam('blShowFax')}]
            <div class="form-group [{if $aErrors.oxaddress__oxfax}]has-error[{/if}]">
                <label class="control-label col-sm-8 [{if $oView->isFieldRequired(oxaddress__oxfax) }]req[{/if}]">[{ oxmultilang ident="FAX" suffix="COLON"}]</label>
                <div class="col-sm-16">
                    <input class="form-control" type="text" maxlength="128" name="deladr[oxaddress__oxfax]" value="[{if isset( $deladr.oxaddress__oxfax ) }][{ $deladr.oxaddress__oxfax }][{else}][{ $delivadr->oxaddress__oxfax->value }][{/if }]" [{if $oView->isFieldRequired(oxaddress__oxfax) }]required[{/if}]>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
        [{/if}]
    [{/block}]
</div>


[{if !$noFormSubmit}]
    <p>[{ oxmultilang ident="COMPLETE_MARKED_FIELDS" }]</p>
    <button id="accUserSaveBottom" type="submit" class="btn btn-primary" name="save">[{ oxmultilang ident="SAVE" }]</button>
[{/if}]
