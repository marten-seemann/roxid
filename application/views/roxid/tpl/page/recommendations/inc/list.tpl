[{assign var="searchrecomm" value=$oView->getRecommSearch() }]
[{if $oView->getRecommLists()|@count gt 0}]
    <ul class="z-recommendations-list list-unstyled">
        [{foreach from=$oView->getRecommLists() item=recommlist name="testRecList"}]
            [{block name="redommendations_list_content"}]
                <li>
                    <div class="z-recommendations">
                        <div class="title clear">
                            [{assign var="editclass" value=$oViewConf->getActiveClassName()}]
                            [{ if $blEdit }]
                                [{assign var="editclass" value="account_recommlist&amp;fnc=editList"}]
                            [{/if}]
                            <a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=`$editclass`" params="recommid=`$recommlist->oxrecommlists__oxid->value`&amp;searchrecomm=`$searchrecomm`" }]" class="z-recommendations-title" title="[{ $recommlist->oxrecommlists__oxtitle->value}]">[{ $recommlist->oxrecommlists__oxtitle->value }]</a></b>
                            : [{ oxmultilang ident="LIST_BY" }] [{ $recommlist->oxrecommlists__oxauthor->value }]
                            <div class="z-recommendations-buttons pull-right">
                                [{ if $blEdit }]
                                    <form action="[{ $oViewConf->getSelfActionLink() }]" method="post">
                                    [{ $oViewConf->getHiddenSid() }]
                                    <input type="hidden" name="cl" value="account_recommlist">
                                    <input type="hidden" name="fnc" value="editList">
                                    <input type="hidden" name="recommid" value="[{$recommlist->getId()}]">
                                    <button class="btn btn-sm btn-danger" type="submit" name="deleteList" value="1">[{$oViewConf->getRoxidIcon('remove')}] [{ oxmultilang ident="REMOVE" }]</button>
                                    <button class="btn btn-sm btn-default" type="submit" name="editList">[{$oViewConf->getRoxidIcon('edit')}] [{ oxmultilang ident="EDIT" }]</button>
                                    </form>
                                [{/if}]
                            </div>
                        </div>
                        <blockquote>[{$recommlist->oxrecommlists__oxdesc->value}]</blockquote>
                    </div>
                </li>
            [{/block}]
        [{/foreach}]
    </ul>
[{else}]
    [{ oxmultilang ident="NO_LISTMANIA_LIST_FOUND" }]
[{/if}]
