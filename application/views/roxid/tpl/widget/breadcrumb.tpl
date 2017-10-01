[{strip}]
<div id="breadcrumb" class="container hidden-xs">
    <span class="breadcrumb-label">[{ oxmultilang ident="YOU_ARE_HERE" suffix="COLON"}]</span>
    <ul class="breadcrumb">
        [{foreach from=$oView->getBreadCrumb() item=sCrum}]
            [{if $sCrum.link }]
                <li>
                    <a href="[{ $sCrum.link }]" title="[{ $sCrum.title|escape:'html'}]">[{/if}][{$sCrum.title}][{if $sCrum.link }]</a>
                </li>
            [{/if}]
        [{/foreach}]
    </ul>
</div>
[{/strip}]
