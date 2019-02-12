[{strip}]
<div id="breadcrumb" class="container hidden-xs">
    <span class="breadcrumb-label">[{ oxmultilang ident="YOU_ARE_HERE" suffix="COLON"}]</span>
    <ul class="breadcrumb">
        [{foreach from=$oView->getBreadCrumb() item=sCrum}]
            <li>
                [{if $sCrum.link }]<a href="[{ $sCrum.link }]" title="[{ $sCrum.title|escape:'html'}]">[{/if}]
                    [{$sCrum.title}]
                [{if $sCrum.link }]</a>[{/if}]
            </li>
        [{/foreach}]
    </ul>
</div>
[{/strip}]
