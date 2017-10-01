[{capture append="oxidBlock_pageBody"}]
    [{oxid_include_widget cl="oxwCookieNote" _parent=$oView->getClassName() nocookie=1}]
[{/capture}]
[{capture append="oxidBlock_content"}]
    <div class="z-privatesales-login">
        <div class="page-header">
            <h1>[{ $oView->getTitle() }]</h1>
        </div>
        [{ if $oView->confirmTerms()}]
            [{include file="form/privatesales/accept_terms.tpl"}]
        [{else}]
            <div class="z-privatesales-form row">
                <div class="col-md-15">
                    <p>[{ oxmultilang ident="LOGIN_ALREADY_CUSTOMER" suffix="COLON" }]</p>
                </div>
                <div class="z-privatesales-languages col-md-6 col-md-offset-3">
                    [{include file="widget/header/languages.tpl"}]
                </div>
            </div>
            [{include file="form/login_account.tpl"}]
        [{/if }]
    </div>
[{/capture}]

[{include file="layout/popup.tpl"}]
