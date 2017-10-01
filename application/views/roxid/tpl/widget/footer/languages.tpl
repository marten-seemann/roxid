[{if $oView->isLanguageLoaded()}]
    [{if $oxcmp_lang|@count > 1}]
        <div class="pull-left">[{oxmultilang ident="LANGUAGE" suffix="COLON"}]</div>
        <ul class="list-unstyled list-inline">
            [{foreach from=$oxcmp_lang item=_lng}]
                [{assign var="sLangImg" value="lang/"|cat:$_lng->abbr|cat:".png"}]
                <li>
                    [{if $_lng->selected}]<strong>[{/if}]
                    <a href="[{$_lng->link|oxaddparams:$oView->getDynUrlParams()}]" hreflang="[{$_lng->abbr }]">[{$_lng->name}]</a>
                    [{if $_lng->selected}]</strong>[{/if}]
                </li>
            [{/foreach}]
        </ul>
    [{/if}]
[{/if}]
