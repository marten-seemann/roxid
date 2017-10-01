[{if $editable}]
    <tfoot>
        <tr>
            <td colspan="[{$basket_num_columns}]">
                [{block name="checkout_basketcontents_basketfunctions"}]
                    [{if $editable }]
                        <div id="basketFn" class="basketFunctions">
                            [{*  basket update/delete buttons  *}]
                            <input type="checkbox" class="hidden-phone" name="checkAll" id="checkAll" title="[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_SELECT_ALL" }]">
                            <button id="basketRemoveAll" class="btn btn-small hidden-phone" name="removeAllBtn"><span>[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_SELECT_ALL" }]</span></button>
                            <button id="basketRemove" class="btn btn-small btn-danger hidden-phone" type="submit" name="removeBtn"><span>[{$oViewConf->getRoxidIcon('basket_remove')}] [{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_REMOVE" }]</span></button>
                            <button id="basketUpdate" class="btn btn-small" type="submit" name="updateBtn"><span>[{$oViewConf->getRoxidIcon('refresh')}] [{ oxmultilang ident="UPDATE" }]</span></button>
                        </div>
                    [{/if}]
                [{/block}]
            </td>
        </tr>
    </tfoot>
[{/if}]
