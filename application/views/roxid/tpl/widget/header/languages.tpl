[{if $oView->isLanguageLoaded()}]
    [{capture name="languageList"}]
        [{foreach from=$oxcmp_lang item=_lng}]
        [{assign var="sLangImg" value="lang/"|cat:$_lng->abbr|cat:".png"}]
        [{if $_lng->selected}]
            [{capture name="languageSelected"}]
                [{*<a class="flag [{$_lng->abbr }]" title="[{$_lng->name}]" href="[{$_lng->link|oxaddparams:$oView->getDynUrlParams()}]" hreflang="[{$_lng->abbr }]"><span style="background-image:url('[{$oViewConf->getImageUrl($sLangImg)}]')" >[{$_lng->name}]</span></a>*}]
                [{$_lng->name}]
            [{/capture}]
        [{/if}]
            [{*<li><a class="flag [{$_lng->abbr }] [{if $_lng->selected}]selected[{/if}]" title="[{$_lng->name}]" href="[{$_lng->link|oxaddparams:$oView->getDynUrlParams()}]" hreflang="[{$_lng->abbr }]"><span style="background-image:url('[{$oViewConf->getImageUrl($sLangImg)}]')">[{$_lng->name}]</span></a></li>*}]
            <li><a href="[{$_lng->link|oxaddparams:$oView->getDynUrlParams()}]" hreflang="[{$_lng->abbr }]">[{$_lng->name}]</a></li>
        [{/foreach}]
    [{/capture}]

    [{if $oxcmp_lang|@count > 1}]
        <div class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">[{$oViewConf->getRoxidIcon('language_selector')}] [{$smarty.capture.languageSelected}] <i class="fa fa-caret-down"></i></a>
            <ul class="dropdown-menu" role="menu">
                [{$smarty.capture.languageList}]
            </ul>
        </div>
    [{/if}]
[{/if}]
[{oxscript widget=$oView->getClassName()}]
