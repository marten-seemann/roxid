[{if !$basketitem->isBundle() || !$basketitem->isDiscountArticle()}]
    [{assign var="oSelections" value=$basketproduct->getSelections(null,$basketitem->getSelList())}]
    [{if $oSelections}]
        <div class="z-selectlist selectorsBox clear" id="cartItemSelections_[{$smarty.foreach.basketContents.iteration}]">
            <table class="dropdown-table"><tbody>
                [{foreach from=$oSelections item=oList name=selections}]
                    [{if $oViewConf->showSelectListsInList()}]
                        [{include file="widget/product/selectbox.tpl" oSelectionList=$oList sFieldName="aproducts[`$basketindex`][sel]" iKey=$smarty.foreach.selections.index blHideDefault=true sSelType="seldrop"}]
                    [{else}]
                        [{assign var="oActiveSelection" value=$oList->getActiveSelection()}]
                        [{if $oActiveSelection}]
                            <tr>
                                <th>[{$oList->getLabel()}]:</th>
                                <td>
                                    [{$oActiveSelection->getName()}]
                                    <input type="hidden" name="aproducts[[{$basketindex}]][sel][[{$smarty.foreach.selections.index}]]" value="[{if $oActiveSelection }][{$oActiveSelection->getValue()}][{/if}]">
                                </td>
                            </tr>
                        [{/if}]
                    [{/if}]
                [{/foreach}]
            </tbody></table>
        </div>
    [{/if}]
[{/if }]
