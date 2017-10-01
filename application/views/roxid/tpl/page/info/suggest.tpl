[{capture append="oxidBlock_content"}]
    <div class="page-header">
        <h1>[{ $oView->getTitle() }]</h1>
    </div>
    <p>[{ oxmultilang ident="MESSAGE_ENTER_YOUR_ADDRESS_AND_MESSAGE" }]</p>
    <p>[{ oxmultilang ident="MESSAGE_RECOMMEND_CLICK_ON_SEND" }]</p>
    [{oxifcontent ident="oxsecurityinfo" object="oCont"}]
        <p>[{ oxmultilang ident="MESSAGE_READ_DETAILS" }] <a href="[{ $oCont->getLink() }]" rel="nofollow">[{ $oCont->oxcontents__oxtitle->value }]</a></p>
    [{/oxifcontent}]
    <div class="col-md-18">
        [{include file="form/suggest.tpl"}]
    </div>
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]
