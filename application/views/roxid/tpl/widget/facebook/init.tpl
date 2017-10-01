[{if $oViewConf->getFbAppId()}]
    <div id="fb-root"></div>
    [{if $oView->isActive('FacebookConfirm') && !$oView->isFbWidgetVisible()}]
        <div id="fbinfo" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title">[{oxmultilang ident="FACEBOOK_ENABLE_INFOTEXTHEADER"}]</h4>
                    </div>
                    <div class="modal-body">
                        [{oxifcontent ident="oxfacebookenableinfotext" object="oCont"}]
                            [{$oCont->oxcontents__oxcontent->value}]
                        [{/oxifcontent}]
                    </div>
                </div>
            </div>
        </div>
        [{capture name="facebookInit"}]
            [{assign var="sFbAppId" value=$oViewConf->getFbAppId()}]
            [{assign var="sLocale" value="FACEBOOK_LOCALE"|oxmultilangassign}]
            [{assign var="sLoginUrl" value=$oView->getLink()|oxaddparams:"fblogin=1"}]
            [{assign var="sLogoutUrl" value=$oViewConf->getLogoutLink()}]
            [{oxscript add="$('.oxfbenable').click( function() { oxFacebook.showFbWidgets('`$sFbAppId`','`$sLocale`','`$sLoginUrl`','`$sLogoutUrl`'); return false;});"}]
            [{oxscript add="$('.oxfbinfo').bind('click', function() { $('#fbinfo').modal(); return false; });"}]
        [{/capture}]
    [{else}]
        [{capture name="facebookInit"}]
            oxFacebook.fbInit("[{$oViewConf->getFbAppId()}]", "[{oxmultilang ident="FACEBOOK_LOCALE"}]", "[{$oView->getLink()|oxaddparams:"fblogin=1"}]", "[{$oViewConf->getLogoutLink()}]");
        [{/capture}]
    [{/if}]
    [{oxscript add="`$smarty.capture.facebookInit`"}]
[{/if}]
