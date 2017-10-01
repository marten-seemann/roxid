[{capture append="oxidBlock_pageBody"}]
    [{if $oView->isEnabledPrivateSales()}]
        [{oxid_include_widget cl="oxwCookieNote" _parent=$oView->getClassName() nocookie=1}]
    [{/if}]
[{/capture}]
[{capture append="oxidBlock_content"}]
    <div class="page-header">
        <h1>[{$oView->getTitle()}]</h1>
    </div>

    [{if $oView->isExpiredLink() }]
        <div class="alert alert-danger">[{ oxmultilang ident="ERROR_MESSAGE_PASSWORD_LINK_EXPIRED" }]</div>
    [{elseif $oView->showUpdateScreen() }]
        <div class="row">
            <div class="col-lg-12 col-md-16">
                [{include file="form/forgotpwd_change_pwd.tpl"}]
            </div>
        </div>
    [{elseif $oView->updateSuccess() }]
        <div class="alert alert-success">[{ oxmultilang ident="PASSWORD_CHANGED" }]</div>
        <div>
            <form action="[{ $oViewConf->getSelfActionLink() }]" name="forgotpwd" method="post">
                <div>
                    [{ $oViewConf->getHiddenSid() }]
                    <input type="hidden" name="cl" value="start">
                    <button id="backToShop" class="btn btn-default" type="submit">[{ oxmultilang ident="BACK_TO_SHOP" }]</button>
                </div>
            </form>
        </div>
    [{else}]
        [{if $oView->getForgotEmail()}]
            <div class="alert alert-success">[{ oxmultilang ident="PASSWORD_WAS_SEND_TO" suffix="COLON" }] [{$oView->getForgotEmail()}]</div>
            <div class="bar">
                <form action="[{ $oViewConf->getSelfActionLink() }]" name="forgotpwd" method="post">
                    <div>
                        [{ $oViewConf->getHiddenSid() }]
                        <input type="hidden" name="cl" value="start">
                        <button id="backToShop" class="btn btn-default" type="submit">[{ oxmultilang ident="BACK_TO_SHOP" }]</button>
                    </div>
                 </form>
             </div>
        [{else}]
            [{include file="form/forgotpwd_email.tpl" modal=false}]
        [{/if}]
    [{/if}]
[{/capture}]

[{if $oView->isActive('PsLogin') }]
    [{include file="layout/popup.tpl"}]
[{else}]
    [{include file="layout/page.tpl"}]
[{/if}]
