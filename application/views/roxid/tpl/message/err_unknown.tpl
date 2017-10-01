[{capture append="oxidBlock_pageBody"}]
    <div class="alert alert-danger">
        <div><strong>[{ oxmultilang ident="[{ oxmultilang ident="ERROR_MESSAGE_UNKNOWN_ERROR" }] #[{ $oView->getErrorNumber() }] !</strong></div>
        <div>[{ oxmultilang ident="MESSAGE_PLEASE_CONTACT_SUPPORT" }]</div>
    </div>
[{/capture}]
[{include file="layout/base.tpl"}]
