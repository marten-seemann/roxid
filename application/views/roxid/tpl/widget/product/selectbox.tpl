[{oxscript add="$.initSelectDropDowns();" }]
[{assign var="oSelections" value=$oSelectionList->getSelections()}]
[{if $oSelections}]
    <tr>
        <th>[{$oSelectionList->getLabel()}]:</th>
        <td>
            <div class="dropdown z-variant-dropdown variant-dropdown dropDown [{$sJsAction}]">
                <a href="#" class="dropdown-toggle selectorLabel [{if $editable === false}] js-disabled[{/if}]" data-toggle="dropdown">
                    [{assign var="oActiveSelection" value=$oSelectionList->getActiveSelection()}]
                    [{if $oActiveSelection}]
                        <span>[{$oActiveSelection->getName()}]</span>
                        <i class="fa fa-caret-down"></i>
                    [{elseif !$blHideDefault}]
                        [{if $sFieldName == "sel" }]
                            [{ assign var="message" value="PLEASE_CHOOSE"|oxmultilangassign }]
                        [{else}]
                            [{ assign var="message" value="CHOOSE_VARIANT"|oxmultilangassign }]
                        [{/if}]
                        <span [{if $blInDetails}]class="selectMessage"[{/if}]>[{$message}]</span>
                        <i class="fa fa-caret-down"></i>
                    [{/if}]
                </a>
                [{if $editable !== false}]
                    <input type="hidden" name="[{$sFieldName|default:"varselid"}][[{$iKey}]]" value="[{if $oActiveSelection }][{$oActiveSelection->getValue()}][{/if}]">
                    <ul class="dropdown-menu dropmenu [{$sSelType|default:"vardrop"}]">
                        [{*if $oActiveSelection && !$blHideDefault}]
                            <li><a rel="" href="#">
                                [{if $sFieldName == "sel" }]
                                    [{ oxmultilang ident="PLEASE_CHOOSE" }]
                                [{else}]
                                    [{ oxmultilang ident="CHOOSE_VARIANT" }]
                                [{/if}]
                            </a></li>
                        [{/if*}]
                        [{foreach from=$oSelections item=oSelection}]
                            <li class="[{if $oSelection->isDisabled()}]js-disabled disabled[{/if}]">
                                <a data-selection-id="[{$oSelection->getValue()}]" href="[{$oSelection->getLink()}]" class="[{if $oSelection->isActive()}]selected[{/if}]">[{$oSelection->getName()}]</a>
                            </li>
                        [{/foreach}]
                    </ul>
                [{/if}]
            </div>
        </td>
    </tr>
[{else}]
    <a href="[{ $_productLink }]" class="variantMessage">
    [{if $sFieldName == "sel" }]
        [{ oxmultilang ident="PLEASE_CHOOSE" }]
    [{else}]
        [{ oxmultilang ident="CHOOSE_VARIANT" }]
    [{/if}]
    </a>
[{/if}]
