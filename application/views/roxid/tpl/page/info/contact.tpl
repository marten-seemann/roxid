[{capture append="oxidBlock_content"}]
    [{if $oView->getContactSendStatus() }]
        [{assign var="_statusMessage" value="THANK_YOU_MESSAGE"|oxmultilangassign:$oxcmp_shop->oxshops__oxname->value}]
        [{include file="message/notice.tpl" statusMessage=$_statusMessage}]
    [{/if }]
    <div class="page-header">
        <h1>[{ $oView->getTitle() }]</h1>
    </div>

    [{include file="page/info/maps.tpl"}]

    <div class="row">
        <div class="col-md-16">
            <fieldset>
                <legend>[{oxmultilang ident="CONTACT"}]</legend>
                [{include file="form/contact.tpl"}]
            </fieldset>
        </div>
        <div class="col-md-8">
            <fieldset>
                <legend>[{oxmultilang ident="ADDRESS"}]</legend>
                <address class="z-company-address">
                    [{ $oxcmp_shop->oxshops__oxcompany->value }]<br>
                    [{ $oxcmp_shop->oxshops__oxstreet->value }]<br>
                    [{ $oxcmp_shop->oxshops__oxzip->value }]&nbsp;[{ $oxcmp_shop->oxshops__oxcity->value }]<br>
                    [{ $oxcmp_shop->oxshops__oxcountry->value }]<br><br>
                    [{ if $oxcmp_shop->oxshops__oxtelefon->value}]
                        <strong>[{ oxmultilang ident="PHONE" suffix="COLON" }]</strong> [{ $oxcmp_shop->oxshops__oxtelefon->value }]<br>
                    [{/if}]
                    [{ if $oxcmp_shop->oxshops__oxtelefax->value}]
                        <strong>[{ oxmultilang ident="FAX" suffix="COLON" }]</strong> [{ $oxcmp_shop->oxshops__oxtelefax->value }]<br>
                    [{/if}]
                    [{ if $oxcmp_shop->oxshops__oxinfoemail->value}]
                        <strong>[{ oxmultilang ident="EMAIL" suffix="COLON" }]</strong> [{oxmailto address=$oxcmp_shop->oxshops__oxinfoemail->value encode="javascript"}]<br>
                    [{/if}]
                </address>
            </fieldset>
        </div>
    </div>
[{/capture}]

[{include file="layout/page.tpl" sidebar="Left"}]
