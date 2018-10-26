[{assign var="bIsError" value=0 }]
[{capture name=loginErrors}]
    [{foreach from=$Errors.loginBoxErrors item=oEr key=key name=errors}]
        [{if $smarty.foreach.errors.first}][{ $oEr->getOxMessage()}][{/if}]
        [{assign var="bIsError" value=1 }]
    [{/foreach}]
[{/capture}]

[{if !$oxcmp_user->oxuser__oxpassword->value}]
    <a href="#" title="[{ oxmultilang ident="LOGIN" }]" class="dropdown-toggle" data-toggle="dropdown">[{$oViewConf->getRoxidIcon('login')}] [{ oxmultilang ident="LOGIN" }] <i class="fa fa-caret-down"></i></a>
    <ul class="dropdown-menu" role="menu">
        <li class="z-loginbox" [{if $bIsError}]style="display: block;"[{/if}]>
            <form id="login" name="login" action="[{ $oViewConf->getSslSelfLink() }]" method="post" data-toggle="roxid-validator">
                [{ $oViewConf->getHiddenSid() }]
                [{ $oViewConf->getNavFormParams() }]
                <input type="hidden" name="fnc" value="login_noredirect">
                <input type="hidden" name="cl" value="[{ $oViewConf->getTopActiveClassName() }]">
                [{if $oViewConf->getTopActiveClassName() eq "content"}]
                    <input type="hidden" name="oxcid" value="[{ $oViewConf->getContentId() }]">
                [{/if}]
                <input type="hidden" name="pgNr" value="[{$oView->getActPage()}]">
                <input type="hidden" name="CustomError" value="loginBoxErrors">
                [{if $oViewConf->getActArticleId()}]
                    <input type="hidden" name="anid" value="[{ $oViewConf->getActArticleId() }]">
                [{/if}]
                [{if $bIsError && $smarty.post.lgn_usr }] [{* fixes Azure error: after a false login the loginbox would pop up again and again until the correct login data is entered *}]
                    <div class="alert alert-danger">[{$smarty.capture.loginErrors}]</div>
                    [{oxscript add="$('#header-login .dropdown-toggle').trigger('click'); "}]
                [{/if}]
                <div class="form-group">
                    <label for="loginEmail">[{ oxmultilang ident="EMAIL_ADDRESS" }]</label>
                    <input id="loginEmail" type="email" name="lgn_usr" value="" class="form-control" required>
                    <div class="help-block with-errors"></div>
                </div>
                <div class="form-group">
                    <label for="loginPasword">[{ oxmultilang ident="PASSWORD" }]</label>
                    <input id="loginPasword" type="password" name="lgn_pwd" class="form-control" value="" required>
                    <div class="help-block with-errors"></div>
                </div>

                [{if $oViewConf->isFunctionalityEnabled( "blShowRememberMe" )}]
                    <div class="checkbox">
                        <label for="remember"><input type="checkbox" class="checkbox" value="1" name="lgn_cook" id="remember"> [{ oxmultilang ident="REMEMBER_ME" }]</label>
                    </div>
                [{/if}]
                <button type="submit" class="btn btn-primary">[{$oViewConf->getRoxidIcon('login')}] [{ oxmultilang ident="LOGIN" }]</button>
                <div>
                    <a href="#" data-toggle="modal" data-target="#forgot-pwd-modal">[{ oxmultilang ident="FORGOT_PASSWORD" }]</a>
                </div>
            </form>
        </li>
        [{if !$oxcmp_user}]
            <li role="menuitem" class="divider"></li>
            <li role="menuitem">
                <a id="registerLink" href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=register" }]" title="[{oxmultilang ident="REGISTER"}]" class="dropdown-toggle">[{$oViewConf->getRoxidIcon('register')}] [{oxmultilang ident="REGISTER"}]</a>
            </li>
        [{/if}]
    </ul>
[{else}]
    [{*
    [{ oxmultilang ident="GREETING" }]
    [{assign var="fullname" value=$oxcmp_user->oxuser__oxfname->value|cat:" "|cat:$oxcmp_user->oxuser__oxlname->value }]
        <a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account"}]">
    [{if $fullname}]
        [{ $fullname }]
    [{else}]
        [{ $oxcmp_user->oxuser__oxusername->value|oxtruncate:25:"...":true }]
    [{/if}]
    </a>
    *}]
    <a id="logoutLink" class="logoutLink" href="[{ $oViewConf->getLogoutLink() }]" title="[{ oxmultilang ident="LOGOUT" }]">[{$oViewConf->getRoxidIcon('logout')}] [{ oxmultilang ident="LOGOUT" }]</a>
[{/if}]
