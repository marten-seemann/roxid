[{block name="widget_locator_attributes"}]
    <form method="post" action="[{ $oViewConf->getSelfActionLink() }]" name="_filterlist">
        [{ $oViewConf->getHiddenSid() }]
        [{ $oViewConf->getNavFormParams() }]
        <input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
        <input type="hidden" name="tpl" value="[{$oViewConf->getActTplName()}]">
        <input type="hidden" name="oxloadid" value="[{$oViewConf->getActContentLoadId()}]">
        <input type="hidden" name="fnc" value="executefilter">
        <input type="hidden" name="fname" value="">
        <table class="dropdown-table"><tbody>
            [{foreach from=$attributes item=oFilterAttr key=sAttrID name=attr}]
                <tr class="z-attribute-filter-item">
                    <th>[{ $oFilterAttr->getTitle() }]:</th>
                    <td>
                        [{* class js-fnSubmit needed to make the oxDropDown() work *}]
                        <div class="dropdown js-fnSubmit">
                            <input type="hidden" name="attrfilter[[{ $sAttrID }]]" value="[{$oFilterAttr->getActiveValue()}]">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                [{if $oFilterAttr->getActiveValue() }]
                                    [{ $oFilterAttr->getActiveValue() }]
                                [{else}]
                                    [{ oxmultilang ident="PLEASE_CHOOSE" }]
                                [{/if}]
                                <i class="fa fa-caret-down"></i>
                            </a>
                            <ul class="dropdown-menu">
                                [{if $oFilterAttr->getActiveValue() }]
                                    <li><a data-selection-id="" href="#">[{ oxmultilang ident="RESET_SELECTION" }]</a></li>
                                    <li class="divider"></li>
                                [{/if}]
                                [{foreach from=$oFilterAttr->getValues() item=sValue}]
                                    <li><a data-selection-id="[{ $sValue }]" href="#" [{if $oFilterAttr->getActiveValue() == $sValue }]class="selected"[{/if}] >[{ $sValue }]</a></li>
                                [{/foreach}]
                            </ul>
                    </div>
                    </td>
                </tr>
            [{/foreach}]
        </tbody></table>
    </form>
[{/block}]
