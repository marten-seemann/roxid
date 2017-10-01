[{if $aVariantSelections.selections}]
    <div id="variants" class="z-variantlist js-fnSubmit">
        [{assign var="blHasActiveSelections" value=false}]
        <table class="dropdown-table"><tbody>
            [{foreach from=$aVariantSelections.selections item=oList key=iKey}]
                [{if $oList->getActiveSelection()}]
                    [{assign var="blHasActiveSelections" value=true}]
                [{/if}]
                [{include file="widget/product/selectbox.tpl" oSelectionList=$oList iKey=$iKey blInDetails=true}]
            [{/foreach}]
        </tbody></table>
    </div>
[{/if}]

[{if $blHasActiveSelections}]
    <div class="z-variantreset variantReset pull-right">
        [{* Reset link *}]
        <a href="#" class="reset btn btn-default btn-sm">[{ oxmultilang ident="RESET_SELECTION" }]</a>

        [{* Active selections *}]
        [{*
        <label>{ oxmultilang ident="SELECTED_COMBINATION" suffix="COLON" }]</label>
        [{assign var="sSelectionSep" value=""}]
        [{strip}]
            [{foreach from=$aVariantSelections.selections item=oSelectionList name=variantselections}]
                [{assign var="oActiveSelection" value=$oSelectionList->getActiveSelection()}]
                [{if $oActiveSelection }]
                    [{$sSelectionSep}][{$oActiveSelection->getName()}]
                    [{assign var="sSelectionSep" value=", "}]
                [{/if}]
            [{/foreach}]
        [{/strip}]
        *}]
    </div>
[{/if}]

[{if $aVariantSelections.selections}]
    <div class="clear"></div>
[{/if}]
