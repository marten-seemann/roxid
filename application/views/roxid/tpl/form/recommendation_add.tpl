[{if !$oxcmp_user->oxuser__oxusername->value}]
  [{include file="page/account/login.tpl" }]
[{else}]
    [{assign var="product" value=$oView->getProduct()}]
    [{ if $oxcmp_user->getRecommListsCount() }]
        <form class="form-horizontal" action="[{ $oViewConf->getSelfActionLink() }]" method="post">
            <div>
                [{ $oViewConf->getHiddenSid() }]
                [{ $oViewConf->getNavFormParams() }]
                <input type="hidden" name="fnc" value="addToRecomm">
                <input type="hidden" name="cl" value="details">
                <input type="hidden" name="anid" value="[{ $product->oxarticles__oxid->value }]">
            </div>
            <div class="form-group">
                <label class="control-label col-sm-6">[{ oxmultilang ident="SELECT_LISTMANIA_LIST" suffix="COLON" }]</label>
                <div class="col-sm-18">
                    <select name="recomm" class="form-control">
                        [{foreach from=$oView->getRecommLists() item=oList}]
                            <option value="[{$oList->oxrecommlists__oxid->value}]">[{$oList->oxrecommlists__oxtitle->value}]</option>
                        [{/foreach}]
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-6">Description:</label>
                <div class="col-sm-18">
                    <textarea rows="7" name="recomm_txt" class="form-control"></textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-6 col-sm-18">
                    <button class="btn btn-primary" type="submit">[{$oViewConf->getRoxidIcon('listmania')}] [{ oxmultilang ident="ADD_TO_LISTMANIA_LIST" }]</button>
                </div>
            </div>
      </form>
    [{else}]
        [{ oxmultilang ident="NO_LISTMANIA_LIST" }] <a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_recommlist" }]">[{ oxmultilang ident="CLICK_HERE" }]</a>
    [{/if}]
[{/if}]
