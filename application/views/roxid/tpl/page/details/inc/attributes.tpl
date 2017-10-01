<table class="z-attributes table table-hover">
    [{foreach from=$oView->getAttributes() item=oAttr name=attribute}]
    <tr>
        <th><strong>[{$oAttr->title}]</strong></th>
        <td>[{$oAttr->value}]</td>
    </tr>
    [{/foreach}]
</table>
