[{if $oView->loadCurrency()}]
    [{ if $oxcmp_cur|@count > 1 }]
        [{capture name="currencyList"}]
            [{foreach from=$oxcmp_cur item=_cur}]
                [{if $_cur->selected}]
                    [{assign var="selectedCurrency" value=$_cur->name}]
                    [{capture name="currencySelected"}]
                        [{ $_cur->name }]
                    [{/capture}]
                [{/if}]
                <li><a href="[{$_cur->link|oxaddparams:$oView->getDynUrlParams()}]" title="[{ $_cur->name }]" rel="nofollow">[{ $_cur->name }]</a>
            [{/foreach}]
        [{/capture}]

        <div class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">[{$oViewConf->getRoxidIcon('currency_selector')}] [{$smarty.capture.currencySelected}] <i class="fa fa-caret-down"></i></a>
            <ul class="dropdown-menu" role="menu">
                [{$smarty.capture.currencyList}]
            </ul>
        </div>
    [{/if}]
[{/if}]
[{oxscript widget=$oView->getClassName()}]
