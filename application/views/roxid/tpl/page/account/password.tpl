[{capture append="oxidBlock_content"}]
    [{if $oView->isPasswordChanged() }]
       <div class="alert alert-success">
        [{ oxmultilang ident="MESSAGE_PASSWORD_CHANGED" }]
       </div>
    [{/if}]

    <div class="page-header">
        <h1>[{ $oView->getTitle() }]</h1>
    </div>

    [{if count($Errors) > 0 && count($Errors.user) > 0}]
        <div class="alert alert-danger">
            [{foreach from=$Errors.user item=oEr key=key }]
                <p>[{ $oEr->getOxMessage()}]</p>
            [{/foreach}]
        </div>
    [{/if}]

    <div class="row">
        <div class="col-lg-14 col-md-16">
            [{include file="form/user_password.tpl"}]
        </div>
    </div>
[{/capture}]

[{capture append="oxidBlock_sidebar"}]
    [{include file="page/account/inc/account_menu.tpl" active_link="password"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]
