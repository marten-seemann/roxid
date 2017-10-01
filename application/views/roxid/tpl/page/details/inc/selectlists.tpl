[{if $oViewConf->showSelectLists()}]
    [{if $oSelections}]
        <div class="z-selectlist js-fnSubmit clear" id="productSelections">
            <table class="dropdown-table"><tbody>
                [{foreach from=$oSelections item=oList name=selections}]
                    [{include file="widget/product/selectbox.tpl" oSelectionList=$oList sFieldName="sel" iKey=$smarty.foreach.selections.index blHideDefault=true sSelType="seldrop"}]
                [{/foreach}]
            </tbody></table>
        </div>
    [{/if}]
[{/if}]
