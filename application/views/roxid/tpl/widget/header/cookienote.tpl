[{if $oView->isEnabled()}]
    <div id="z-cookie-note" style="display:none;">
        [{oxmultilang ident='COOKIE_NOTE'}]
        <span class="cancelCookie"><a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=clearcookies" }]" title="[{oxmultilang ident='COOKIE_NOTE_DISAGREE'}]">[{oxmultilang ident='COOKIE_NOTE_DISAGREE'}]</a></span>
        <button type="button" class="close"><span aria-hidden="true">&times;</span><span class="sr-only">[{oxmultilang ident='CLOSE'}]</span></button>
    </div>
    [{oxscript add="$('#z-cookie-note').zCookieNote();"}]
[{/if}]
[{oxscript widget=$oView->getClassName()}]
