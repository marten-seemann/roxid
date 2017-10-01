[{block name="widget_header_search_form"}]
    [{if $oView->showSearch() }]
        [{if !$input_id}]
            [{assign var="input_id" value="searchParam"}]
        [{/if}]
        <form class="[{if $mode=="navbar"}]navbar-form navbar-right[{/if}]" action="[{ $oViewConf->getSelfActionLink() }]" method="get" name="search">
            <div>
                [{ $oViewConf->getHiddenSid() }]
                <input type="hidden" name="cl" value="search">
                [{assign var="currency" value=$oView->getActCurrency()}]
                [{if $currency->id}]
                    <input type="hidden" name="cur" value="[{$currency->id}]">
                [{/if}]
                [{block name="header_search_field"}]
                    <div class="input-group">
                        <input class="form-control" type="search" id="[{$input_id}]" name="searchparam" placeholder="[{oxmultilang ident="SEARCH"}]" value="[{$oView->getSearchParamForHtml()}]">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="submit">[{$oViewConf->getRoxidIcon('search')}]</button>
                        </span>
                    </div>
                [{/block}]
            </div>
        </form>
    [{/if}]
[{/block}]
