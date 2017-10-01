<form name="login" class="form-horizontal" action="[{ $oViewConf->getSslSelfLink() }]" method="post" data-toggle="roxid-validator">
    <div class="row z-account-login-options">
        <div class="col-sm-12 z-account-login">
            <fieldset>
                <legend>[{ oxmultilang ident="LOGIN" }]</legend>
                <p>[{ oxmultilang ident="LOGIN_ALREADY_CUSTOMER" }]</p>
                <div>
                    [{ $oViewConf->getHiddenSid() }]
                    [{ $oViewConf->getNavFormParams() }]
                    <input type="hidden" name="fnc" value="login_noredirect">
                    <input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
                    <input type="hidden" name="tpl" value="[{$oViewConf->getActTplName()}]">
                    <input type="hidden" name="oxloadid" value="[{$oViewConf->getActContentLoadId()}]">
                    [{if $oView->getArticleId()}]
                        <input type="hidden" name="aid" value="[{$oView->getArticleId()}]">
                    [{/if}]
                    [{if $oView->getProduct()}]
                        [{assign var="product" value=$oView->getProduct() }]
                        <input type="hidden" name="anid" value="[{ $product->oxarticles__oxnid->value }]">
                    [{/if}]
                </div>
                <div class="row">
                    <div class="col-md-20 col-md-offset-0 col-xs-22 col-xs-offset-1">
                        <div class="form-group [{if $aErrors}]has-error[{/if}]">
                            <label class="control-label col-sm-6">[{ oxmultilang ident="EMAIL" suffix="COLON" }]</label>
                            <div class="col-sm-18">
                                <input id="loginUser" class="form-control" type="email" name="lgn_usr" value="" required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group [{if $aErrors}]has-error[{/if}]">
                            <label class="control-label col-sm-6">[{ oxmultilang ident="PASSWORD" suffix="COLON" }]</label>
                            <div class="col-sm-18">
                                <input id="loginPwd" class="form-control" type="password" name="lgn_pwd" value="" required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        [{if $oView->showRememberMe()}]
                            <div class="form-group">
                                <div class="col-sm-offset-6 col-sm-18">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" id="loginCookie" name="lgn_cook" value="1"> [{ oxmultilang ident="KEEP_LOGGED_IN"}]
                                        </label>
                                    </div>
                                </div>
                            </div>
                        [{/if}]
                        <div class="form-group">
                            <div class="col-sm-offset-6 col-sm-18">
                                <button type="submit" class="btn btn-primary">[{$oViewConf->getRoxidIcon('login')}] [{ oxmultilang ident="LOGIN" }]</button>
                                <div class="z-forgot-pwd">
                                    [{if $oView->isEnabledPrivateSales()}]
                                        <a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=forgotpwd" }]">[{ oxmultilang ident="FORGOT_PASSWORD" }]</a>
                                    [{else}]
                                        <a href="#" data-toggle="modal" data-target="#forgot-pwd-modal">[{ oxmultilang ident="FORGOT_PASSWORD" }]</a>
                                    [{/if}]
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </fieldset>
        </div>

        <div class="col-sm-12">
            <fieldset>
                <legend>[{ oxmultilang ident="OPEN_ACCOUNT" }]</legend>
                <div class="row">
                    <div class="col-md-24 col-xs-22 col-xs-offset-1">
                        [{oxifcontent ident="oxregistrationdescription" object="oCont"}]
                            [{$oCont->oxcontents__oxcontent->value}]
                        [{/oxifcontent}]
                        <a href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=register" }]" class="btn btn-default" rel="nofollow">[{$oViewConf->getRoxidIcon('register')}] [{ oxmultilang ident="OPEN_ACCOUNT" }]</a><br />
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
    <div class="clear"></div>
</form>
