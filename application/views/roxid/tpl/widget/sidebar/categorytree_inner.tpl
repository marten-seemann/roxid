[{defun name="tree" categories=$categories}]
    [{assign var="deepLevel" value=$deepLevel+1}]
    [{assign var="oContentCat" value=$oView->getContentCategory() }]
    [{foreach from=$categories item=_cat}]
        [{if $_cat->getIsVisible() }]
            [{* CMS category *}]
            [{if $_cat->getContentCats() && $deepLevel > 1 }]
                [{foreach from=$_cat->getContentCats() item=_oCont}]
                <li [{if $oContentCat && $oContentCat->getId()==$_oCont->getId() }]class="active"[{/if}]>
                    <a href="[{$_oCont->getLink()}]">
                        <i class="placeholder"></i>
                        [{if $_oCont->oxcontents__oxtitle->value == "" }]&nbsp;[{else}][{$_oCont->oxcontents__oxtitle->value }][{/if}]
                    </a>
                </li>
                [{/foreach}]
            [{/if }]
            [{* subcategories *}]
            <li class="[{if !$oContentCat && $act && $act->getId()==$_cat->getId() }]active exp[{elseif $_cat->expanded}]exp[{/if}]">
                <a href="[{$_cat->getLink()}]">
                    [{if $_cat->hasVisibleSubCats}]
                        <i class="icon"></i>
                    [{else}]
                        <i class="placeholder">&nbsp;</i>
                    [{/if}]
                    [{$_cat->oxcategories__oxtitle->value}]
                </a>
                [{if $_cat->getSubCats()}]
                    <ul class="list-unstyled">[{fun name="tree" categories=$_cat->getSubCats() }]</ul>
                [{/if}]
            </li>
        [{/if}]
    [{/foreach}]
[{/defun}]
