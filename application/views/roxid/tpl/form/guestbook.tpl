[{if $oxcmp_user}]
    [{if !$oView->floodProtection() }]
        <form action="[{$oViewConf->getSelfActionLink()}]" method="post" class="form-horizontal" data-toggle="roxid-validator">
            <div class="form-group">
                [{$oViewConf->getHiddenSid()}]
                [{$oViewConf->getNavFormParams()}]
                [{oxid_include_dynamic file="form/formparams.tpl"}]
                <input type="hidden" name="fnc" value="saveEntry">
                <input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
                <label class="col-sm-6 col-lg-4 control-label">[{ oxmultilang ident="MESSAGE" suffix="COLON"}]</label>
                <div class="col-sm-18 col-lg-20">
                    <textarea rows="10" name="rvw_txt" class="form-control" required></textarea>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-18 col-sm-offset-6 col-lg-20 col-lg-offset-4">
                    <button type="submit" class="btn btn-primary">[{oxmultilang ident="SUBMIT"}]</button>
                </div>
            </div>
        </form>
    [{/if}]
[{else}]
    <a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" params="sourcecl="|cat:$oViewConf->getActiveClassName()|cat:$oViewConf->getNavUrlParams() }]" rel="nofollow"><b>[{ oxmultilang ident="MESSAGE_TO_BE_LOGGED_WRITE_GUESTBOOK" }]</b></a><br><br>
[{/if}]
