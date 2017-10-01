[{capture append="oxidBlock_content"}]
    <div class="page-header">
        <h1>[{ $oView->getTitle() }]</h1>
    </div>
    [{include file="form/login_account.tpl"}]
    [{insert name="oxid_tracker" title=$template_title }]
[{/capture}]

[{include file="layout/page.tpl"}]



