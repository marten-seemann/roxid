[{if $oView->loadCurrency()}]
    [{if $oxcmp_cur|@count > 1}]
        <div class="pull-left">[{oxmultilang ident="CURRENCY" suffix="COLON"}]</div>
        <ul class="list-unstyled list-inline">
            [{foreach from=$oxcmp_cur item=_cur}]
                <li>
                    <a href="[{$_cur->link|oxaddparams:$oView->getDynUrlParams()}]" title="[{ $_cur->name }]" rel="nofollow">
                        [{if $_cur->selected}]<strong>[{/if}]
                        [{ $_cur->name }]
                        [{if $_cur->selected}]</strong>[{/if}]
                    </a>
                </li>
            [{/foreach}]
        </ul>
    [{/if}]
[{/if}]
