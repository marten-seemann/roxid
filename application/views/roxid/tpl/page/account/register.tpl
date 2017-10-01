[{capture append="oxidBlock_pageBody"}]
    [{if $oView->isEnabledPrivateSales()}]
        [{oxid_include_widget cl="oxwCookieNote" _parent=$oView->getClassName() nocookie=1}]
    [{/if}]
[{/capture}]
[{capture append="oxidBlock_content"}]
    [{if $oView->isActive('PsLogin') }]
        [{include file="message/errors.tpl" }]
    [{/if}]
    <div class="page-header">
        <h1>[{ $oView->getTitle() }]</h1>
    </div>

    [{include file="form/register.tpl"}]
[{/capture}]
[{if $oView->isActive('PsLogin') }]
    [{include file="layout/popup.tpl"}]
[{else}]
    [{include file="layout/page.tpl" sidebar="Left"}]
[{/if}]
