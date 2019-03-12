[{assign var="invadr" value=$oView->getInvoiceAddress()}]
[{assign var="blBirthdayRequired" value=$oView->isFieldRequired(oxuser__oxbirthdate)}]
[{if isset( $invadr.oxuser__oxbirthdate.month ) }]
    [{assign var="iBirthdayMonth" value=$invadr.oxuser__oxbirthdate.month }]
[{elseif $oxcmp_user->oxuser__oxbirthdate->value && $oxcmp_user->oxuser__oxbirthdate->value != "0000-00-00" }]
    [{assign var="iBirthdayMonth" value=$oxcmp_user->oxuser__oxbirthdate->value|regex_replace:"/^([0-9]{4})[-]/":""|regex_replace:"/[-]([0-9]{1,2})$/":"" }]
[{else}]
    [{assign var="iBirthdayMonth" value=0}]
[{/if}]
[{if isset( $invadr.oxuser__oxbirthdate.day ) }]
    [{assign var="iBirthdayDay" value=$invadr.oxuser__oxbirthdate.day}]
[{elseif $oxcmp_user->oxuser__oxbirthdate->value && $oxcmp_user->oxuser__oxbirthdate->value != "0000-00-00"}]
    [{assign var="iBirthdayDay" value=$oxcmp_user->oxuser__oxbirthdate->value|regex_replace:"/^([0-9]{4})[-]([0-9]{1,2})[-]/":"" }]
[{else}]
    [{assign var="iBirthdayDay" value=0}]
[{/if}]
[{if isset( $invadr.oxuser__oxbirthdate.year ) }]
    [{assign var="iBirthdayYear" value=$invadr.oxuser__oxbirthdate.year }]
[{elseif $oxcmp_user->oxuser__oxbirthdate->value && $oxcmp_user->oxuser__oxbirthdate->value != "0000-00-00" }]
    [{assign var="iBirthdayYear" value=$oxcmp_user->oxuser__oxbirthdate->value|regex_replace:"/[-]([0-9]{1,2})[-]([0-9]{1,2})$/":"" }]
[{else}]
    [{assign var="iBirthdayYear" value=0}]
[{/if}]

[{block name="form_user_billing_address_inner"}]
    <div class="form-group">
        <label class="control-label col-sm-8 col-xs-6 radio [{if $oView->isFieldRequired(oxuser__oxsal)}]req[{/if}]">[{ oxmultilang ident="TITLE" suffix="COLON" }]</label>
        <div class="col-sm-16 col-xs-18">
            [{include file="form/fieldset/salutation.tpl" name="invadr[oxuser__oxsal]" value=$oxcmp_user->oxuser__oxsal->value value2=$invadr.oxuser__oxsal required=$oView->isFieldRequired(oxuser__oxsal)}]
        </div>
    </div>
    <div class="form-group [{if $aErrors.oxuser__oxfname}]has-error[{/if}]">
        <label class="control-label col-sm-8 [{if $oView->isFieldRequired(oxuser__oxfname) }]req[{/if}]">[{ oxmultilang ident="FIRST_NAME" suffix="COLON" }]</label>
        <div class="col-sm-16">
            <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxfname]" value="[{if isset( $invadr.oxuser__oxfname ) }][{ $invadr.oxuser__oxfname }][{else }][{ $oxcmp_user->oxuser__oxfname->value }][{/if}]" [{if $oView->isFieldRequired(oxuser__oxfname) }]required[{/if}]>
            <div class="help-block with-errors">[{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxfname}]</div>
        </div>
    </div>
    <div class="form-group [{if $aErrors.oxuser__oxlname}]has-error[{/if}]">
        <label class="control-label col-sm-8 [{if $oView->isFieldRequired(oxuser__oxlname) }]req[{/if}]">[{ oxmultilang ident="LAST_NAME" suffix="COLON" }]</label>
        <div class="col-sm-16">
            <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxlname]" value="[{if isset( $invadr.oxuser__oxlname ) }][{ $invadr.oxuser__oxlname }][{else }][{ $oxcmp_user->oxuser__oxlname->value }][{/if}]" [{if $oView->isFieldRequired(oxuser__oxlname) }]required[{/if}]>
            <div class="help-block with-errors">[{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxlname}]</div>
        </div>
    </div>
    <div class="form-group [{if $aErrors.oxuser__oxcompany}]has-error[{/if}]">
        <label class="control-label col-sm-8 [{if $oView->isFieldRequired(oxuser__oxcompany) }]req[{/if}]">[{ oxmultilang ident="COMPANY" suffix="COLON" }]</label>
        <div class="col-sm-16">
            <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxcompany]" value="[{if isset( $invadr.oxuser__oxcompany ) }][{ $invadr.oxuser__oxcompany }][{else }][{ $oxcmp_user->oxuser__oxcompany->value }][{/if}]" [{if $oView->isFieldRequired(oxuser__oxcompany) }]required[{/if}]>
            <div class="help-block with-errors">[{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxcompany}]</div>
        </div>
    </div>
    <div class="form-group [{if $aErrors.oxuser__oxaddinfo}]has-error[{/if}]">
        [{assign var="_address_addinfo_tooltip" value="FORM_FIELDSET_USER_BILLING_ADDITIONALINFO_TOOLTIP"|oxmultilangassign }]
        <label class="control-label col-sm-8 [{if $oView->isFieldRequired(oxuser__oxaddinfo) }]req[{/if}]" [{if $_address_addinfo_tooltip}]title="[{$_address_addinfo_tooltip}]" class="tooltip"[{/if}] >[{ oxmultilang ident="ADDITIONAL_INFO" suffix="COLON" }]</label>
        <div class="col-sm-16">
            <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxaddinfo]" value="[{if isset( $invadr.oxuser__oxaddinfo ) }][{ $invadr.oxuser__oxaddinfo }][{else }][{ $oxcmp_user->oxuser__oxaddinfo->value }][{/if}]" [{if $oView->isFieldRequired(oxuser__oxaddinfo) }]required[{/if}]>
            <div class="help-block with-errors">[{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxaddinfo}]</div>
        </div>
    </div>
    <div class="form-group [{if $aErrors.oxuser__oxstreet}]has-error[{/if}]">
        <label class="control-label col-sm-8 [{if $oView->isFieldRequired(oxuser__oxstreet) || $oView->isFieldRequired(oxuser__oxstreetnr) }]req[{/if}]">[{ oxmultilang ident="STREET_AND_STREETNO" suffix="COLON" }]</label>
        <div class="col-sm-16">
            <div class="row">
                <div class="col-xs-18">
                    <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxstreet]" value="[{if isset( $invadr.oxuser__oxstreet ) }][{ $invadr.oxuser__oxstreet }][{else }][{ $oxcmp_user->oxuser__oxstreet->value }][{/if}]" [{if $oView->isFieldRequired(oxuser__oxstreet)}]required[{/if}]>
                </div>
                <div class="col-xs-6">
                    <input class="form-control" type="text" maxlength="16" name="invadr[oxuser__oxstreetnr]" value="[{if isset( $invadr.oxuser__oxstreetnr ) }][{ $invadr.oxuser__oxstreetnr }][{else }][{ $oxcmp_user->oxuser__oxstreetnr->value }][{/if}]" [{if $oView->isFieldRequired(oxuser__oxstreetnr)}]required[{/if}]>
                </div>
            </div>
            <div class="help-block with-errors">[{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxstreet}]</div>
        </div>
    </div>
    <div class="form-group [{if $aErrors.oxuser__oxzip}]has-error[{/if}]">
        <label class="control-label col-sm-8 [{if $oView->isFieldRequired(oxuser__oxzip) || $oView->isFieldRequired(oxuser__oxcity) }]req[{/if}]">[{ oxmultilang ident="POSTAL_CODE_AND_CITY" suffix="COLON" }]</label>
        <div class="col-sm-16">
            <div class="row">
                <div class="col-xs-7">
                    <input class="form-control" type="text" maxlength="16" name="invadr[oxuser__oxzip]" value="[{if isset( $invadr.oxuser__oxzip ) }][{ $invadr.oxuser__oxzip }][{else }][{ $oxcmp_user->oxuser__oxzip->value }][{/if}]" [{if $oView->isFieldRequired(oxuser__oxzip)}]required[{/if}]>
                </div>
                <div class="col-xs-17">
                    <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxcity]" value="[{if isset( $invadr.oxuser__oxcity ) }][{ $invadr.oxuser__oxcity }][{else }][{ $oxcmp_user->oxuser__oxcity->value }][{/if}]" [{if $oView->isFieldRequired(oxuser__oxcity)}]required[{/if}]>
                </div>
            </div>
            <div class="help-block with-errors">
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxzip}]
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxcity}]
            </div>
        </div>
    </div>
    <div class="form-group [{if $aErrors.oxuser__oxustid}]has-error[{/if}]">
        <label class="control-label col-sm-8 [{if $oView->isFieldRequired(oxuser__oxustid) }]req[{/if}]">[{ oxmultilang ident="VAT_ID_NUMBER" suffix="COLON" }]</label>
        <div class="col-sm-16">
            <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxustid]" value="[{if isset( $invadr.oxuser__oxustid ) }][{ $invadr.oxuser__oxustid }][{else}][{ $oxcmp_user->oxuser__oxustid->value }][{/if}]" [{if $oView->isFieldRequired(oxuser__oxustid) }]required[{/if}]>
        </div>
        <div class="help-block with-errors">[{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxustid}]</div>
    </div>

    [{block name="form_user_billing_country"}]
        <div class="form-group [{if $aErrors.oxuser__oxcountryid}]has-error[{/if}]">
            <label class="control-label col-sm-8 [{if $oView->isFieldRequired(oxuser__oxcountryid) }]req[{/if}]">[{ oxmultilang ident="COUNTRY" suffix="COLON" }]</label>
            <div class="col-sm-16">
                <select class="form-control" id="invCountrySelect" name="invadr[oxuser__oxcountryid]" [{if $oView->isFieldRequired(oxuser__oxcountryid) }]required[{/if}]>
                    <option value="">-</option>
                    [{assign var="aCountryList" value=$oViewConf->getCountryList()}]
                    [{assign var="blCountrySelected" value=false}]
                    [{foreach from=$aCountryList item=country key=country_id }]
                        [{assign var="sCountrySelect" value=""}]
                        [{if !$blCountrySelected}]
                            [{if (isset($invadr.oxuser__oxcountryid) && $invadr.oxuser__oxcountryid == $country->oxcountry__oxid->value) ||
                                (!isset($invadr.oxuser__oxcountryid) && $oxcmp_user->oxuser__oxcountryid->value == $country->oxcountry__oxid->value) }]
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
                [{*
                <li class="stateBox">
                [{include file="form/fieldset/state.tpl"
                    countrySelectId="invCountrySelect"
                    stateSelectName="invadr[oxuser__oxstateid]"
                    selectedStateIdPrim=$invadr.oxuser__oxstateid
                    selectedStateId=$oxcmp_user->oxuser__oxstateid->value
                }]
                </li>
                *}]
                <div class="help-block with-errors">[{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxcountryid}]</div>
            </div>
    </div>
    [{/block}]

    [{if $oViewConf->getViewThemeParam('blShowFon')}]
        <div class="form-group [{if $aErrors.oxuser__oxfon}]has-error[{/if}]">
            <label class="control-label col-sm-8 [{if $oView->isFieldRequired(oxuser__oxfon) }]req[{/if}]">[{ oxmultilang ident="PHONE" suffix="COLON" }]</label>
            <div class="col-sm-16">
                <input class="form-control" type="text" maxlength="128" name="invadr[oxuser__oxfon]" value="[{if isset( $invadr.oxuser__oxfon ) }][{ $invadr.oxuser__oxfon }][{else }][{ $oxcmp_user->oxuser__oxfon->value }][{/if}]" [{if $oView->isFieldRequired(oxuser__oxfon) }]required[{/if}]>
                <div class="help-block with-errors">[{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxfon}]</div>
            </div>
        </div>
    [{/if}]
    [{if $oViewConf->getViewThemeParam('blShowFax')}]
        <div class="form-group [{if $aErrors.oxuser__oxfax}]has-error[{/if}]">
            <label class="control-label col-sm-8 [{if $oView->isFieldRequired(oxuser__oxfax) }]req[{/if}]">[{ oxmultilang ident="FAX" suffix="COLON" }]</label>
            <div class="col-sm-16">
                <input class="form-control" type="text" maxlength="128" name="invadr[oxuser__oxfax]" value="[{if isset( $invadr.oxuser__oxfax ) }][{ $invadr.oxuser__oxfax }][{else }][{ $oxcmp_user->oxuser__oxfax->value }][{/if}]" [{if $oView->isFieldRequired(oxuser__oxfax) }]required[{/if}]>
                <div class="help-block with-errors">[{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxfax}]</div>
            </div>
        </div>
    [{/if}]
    [{if $oViewConf->getViewThemeParam('blShowMobFon')}]
        <div class="form-group [{if $aErrors.oxuser__oxmobfon}]has-error[{/if}]">
            <label class="control-label col-sm-8 [{if $oView->isFieldRequired(oxuser__oxmobfon) }]req[{/if}]">[{ oxmultilang ident="CELLUAR_PHONE" suffix="COLON"}]</label>
            <div class="col-sm-16">
                <input class="form-control" type="text" maxlength="64" name="invadr[oxuser__oxmobfon]" value="[{if isset( $invadr.oxuser__oxmobfon ) }][{$invadr.oxuser__oxmobfon }][{else}][{$oxcmp_user->oxuser__oxmobfon->value }][{/if}]" [{if $oView->isFieldRequired(oxuser__oxmobfon) }]required[{/if}]>
                <div class="help-block with-errors">[{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxmobfon}]</div>
            </div>
        </div>
    [{/if}]
    [{if $oViewConf->getViewThemeParam('blShowPrivFon')}]
        <div class="form-group [{if $aErrors.oxuser__oxprivfon}]has-error[{/if}]">
            <label class="control-label col-sm-8 [{if $oView->isFieldRequired(oxuser__oxprivfon) }]req[{/if}]">[{ oxmultilang ident="PERSONAL_PHONE" suffix="COLON" }]</label>
            <div class="col-sm-16">
                <input class="form-control" type="text" maxlength="64" name="invadr[oxuser__oxprivfon]" value="[{if isset( $invadr.oxuser__oxprivfon ) }][{$invadr.oxuser__oxprivfon }][{else}][{$oxcmp_user->oxuser__oxprivfon->value }][{/if}]" [{if $oView->isFieldRequired(oxuser__oxprivfon) }]required[{/if}]>
                <div class="help-block with-errors">[{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxprivfon}]</div>
            </div>
        </div>
    [{/if}]
    [{if $oViewConf->showBirthdayFields() }]
        <div class="form-group form-inline form-inline-xs [{if $aErrors.oxuser__oxbirthdate}]has-error[{/if}]">
            <label class="control-label col-sm-8 [{if $oView->isFieldRequired(oxuser__oxbirthdate) }]req[{/if}]">[{ oxmultilang ident="BIRTHDATE" suffix="COLON" }]</label>
            <div class="col-sm-16">
                <div class="hidden-xs">
                    <input id="oxDay" class='form-control input-xmini' name='invadr[oxuser__oxbirthdate][day]' type="text" placeholder="[{ oxmultilang ident="DAY" }]" maxlength="2" value="[{if $iBirthdayDay > 0 }][{$iBirthdayDay }][{/if}]" [{if $oView->isFieldRequired(oxuser__oxbirthdate) }]required[{/if}]>
                    <select id="oxMonth" class="form-control input-mini" name="invadr[oxuser__oxbirthdate][month]" required>
                        [{section name="month" start=1 loop=13 }]
                            <option value="[{$smarty.section.month.index}]" [{if $iBirthdayMonth == $smarty.section.month.index}] selected="selected" [{/if}]>
                                [{oxmultilang ident="MONTH_NAME_"|cat:$smarty.section.month.index}]
                            </option>
                        [{/section}]
                    </select>
                    <input id="oxYear" class='form-control input-small' name='invadr[oxuser__oxbirthdate][year]' type="text" placeholder="[{ oxmultilang ident="YEAR" }]" maxlength="4" value="[{if $iBirthdayYear }][{$iBirthdayYear }][{/if}]" [{if $oView->isFieldRequired(oxuser__oxbirthdate) }]required[{/if}]>
                </div>
                <div class="visible-xs">
                    <input type="date" id="bday" max="[{$smarty.now|date_format:'%Y-%m-%d'}]" value="[{if $iBirthdayDay > 0 && $iBirthdayMonth > 0 && $iBirthdayYear > 0}][{$iBirthdayYear}]-[{$iBirthdayMonth}]-[{$iBirthdayDay}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxbirthdate) }]required[{/if}]>
                    [{oxscript add="$('#bday').zDateInputToDateFields({ day: $('#oxDay'), month: $('#oxMonth'), year: $('#oxYear') })"}]
                </div>
                <div class="help-block with-errors">[{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxbirthdate}]</div>
            </div>
        </div>
    [{/if}]
[{/block}]

[{oxscript add="$(document).ready(function() {
    $(document).zBillingAddress({
        button: $('#userChangeAddress'),
        form: $('#addressForm'),
        text: $('#addressText'),
    });
});
"}]

[{if !$noFormSubmit}]
    <div class="form-group">
        <div class="col-sm-16">
            <button id="accUserSaveTop" type="submit" name="save" class="btn btn-primary">[{$oViewConf->getRoxidIcon('save')}] [{ oxmultilang ident="SAVE" }]</button>
        </div>
    </div>
[{/if}]
