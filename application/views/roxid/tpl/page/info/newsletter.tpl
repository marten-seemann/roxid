[{capture append="oxidBlock_content"}]
    [{if $oView->getNewsletterStatus() == 4 || !$oView->getNewsletterStatus()}]
        <div class="page-header">
            <h1>[{ $oView->getTitle() }]</h1>
        </div>
        [{oxifcontent ident="oxnewstlerinfo" object="oCont"}]
            [{ $oCont->oxcontents__oxcontent->value }]
        [{/oxifcontent}]
        <br>
        <div class="row">
            <div class="col-md-14 col-sm-20">
                [{include file="form/newsletter.tpl"}]
            </div>
        </div>
  [{elseif $oView->getNewsletterStatus() == 1}]
        <div class="page-header">
            <h1>[{ oxmultilang ident="MESSAGE_THANKYOU_FOR_SUBSCRIBING_NEWSLETTERS" }]</h1>
        </div>
        <div class="alert alert-info">
            [{ oxmultilang ident="MESSAGE_SENT_CONFIRMATION_EMAIL" }]
        </div>
    [{elseif $oView->getNewsletterStatus() == 2}]
        <div class="page-header">
            <h1>[{ oxmultilang ident="MESSAGE_NEWSLETTER_CONGRATULATIONS" }]</h1>
        </div>
        <div class="alert alert-success">
            [{ oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION_ACTIVATED" }]
        </div>
    [{elseif $oView->getNewsletterStatus() == 3}]
        <div class="page-header">
            <h1>[{ oxmultilang ident="SUCCESS" }]</h1>
        </div>
        <div class="alert alert-success">
            [{ oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION_CANCELED" }]
        </div>
    [{/if}]
[{/capture}]

[{include file="layout/page.tpl"}]
