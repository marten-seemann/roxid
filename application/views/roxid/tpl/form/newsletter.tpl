[{assign var="aRegParams" value=$oView->getRegParams()}]
<form class="form-horizontal" action="[{ $oViewConf->getSslSelfLink() }]" method="post" data-toggle="roxid-validator">
    <div>
        [{ $oViewConf->getHiddenSid() }]
        <input type="hidden" name="fnc" value="send">
        <input type="hidden" name="cl" value="newsletter">
        <input type="hidden" name="editval[oxuser__oxcountryid]" value="[{$oView->getHomeCountryId()}]">
    </div>
    <div class="form-group">
        <label class="control-label col-xs-6 radio">[{ oxmultilang ident="TITLE" suffix="COLON" }]</label>
        <div class="col-xs-18">
            [{include file="form/fieldset/salutation.tpl" name="editval[oxuser__oxsal]" value=$aRegParams.oxuser__oxsal required=false}]
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-6">[{ oxmultilang ident="FIRST_NAME" suffix="COLON" }]</label>
        <div class="col-sm-18">
            <input id="newsletterFname" type="text" class="form-control" name="editval[oxuser__oxfname]" maxlength="60" value="[{if $aRegParams.oxuser__oxfname}][{$aRegParams.oxuser__oxfname}][{/if}]">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-6">[{ oxmultilang ident="LAST_NAME" suffix="COLON" }]</label>
        <div class="col-sm-18">
            <input id="newsletterLname" type="text" class="form-control" name="editval[oxuser__oxlname]" maxlength="60" value="[{if $aRegParams.oxuser__oxlname}][{$aRegParams.oxuser__oxlname}][{/if}]">
        </div>
    </div>
    <div class="form-group [{if $aErrors}]has-error[{/if}]">
        <label class="control-label col-sm-6 req">[{ oxmultilang ident="EMAIL" suffix="COLON" }]</label>
        <div class="col-sm-18">
            <input id="newsletterUserName" type="email" class="form-control" name="editval[oxuser__oxusername]" maxlength="60" value="[{if $aRegParams.oxuser__oxusername}][{$aRegParams.oxuser__oxusername}][{/if}]" required>
            <div class="help-block with-errors"></div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-6 col-sm-18">
            <label for="newsletterSubscribeOn" class="radio-inline">
                <input id="newsletterSubscribeOn"  type="radio" name="subscribeStatus" value="1" checked>[{ oxmultilang ident="SUBSCRIBE" }]
            </label>
            <label for="newsletterSubscribeOff" class="radio-inline">
                <input id="newsletterSubscribeOff"  type="radio" name="subscribeStatus" value="0">[{ oxmultilang ident="UNSUBSCRIBE" }]
            </label>
        </div>
    </div>
    [{*<li class="formNote">[{ oxmultilang ident="COMPLETE_MARKED_FIELDS" }]</li>*}]
    <div class="form-group">
        <div class="col-sm-offset-6 col-sm-18">
            <button id="newsLetterSubmit" class="btn btn-primary" type="submit">[{ oxmultilang ident="SUBMIT" }]</button>
        </div>
    </div>
</form>
