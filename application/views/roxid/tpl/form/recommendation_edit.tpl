<form class="form-horizontal" action="[{ $oViewConf->getSelfActionLink() }]" name="saverecommlist" method="post" data-toggle="roxid-validator">
    [{ $oViewConf->getHiddenSid() }]
    [{ $oViewConf->getNavFormParams() }]
    <input type="hidden" name="fnc" value="saveRecommList">
    <input type="hidden" name="cl" value="account_recommlist">
    [{if $actvrecommlist}]
        <input type="hidden" name="recommid" value="[{$actvrecommlist->getId()}]">
    [{/if}]
    <div class="form-group">
        <label class="control-label col-sm-6 req">[{ oxmultilang ident="TITLE" suffix="COLON" }]</label>
        <div class="col-sm-18">
            <input type="text" name="recomm_title" class="form-control" maxlength="73" value="[{$actvrecommlist->oxrecommlists__oxtitle->value}]" required>
            <div class="help-block with-errors"></div>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-6">[{ oxmultilang ident="AUTHOR" suffix="COLON" }]</label>
        <div class="col-sm-18">
            <input type="text" name="recomm_author" class="form-control" maxlength="73" value="[{if $actvrecommlist->oxrecommlists__oxauthor->value}][{$actvrecommlist->oxrecommlists__oxauthor->value}][{elseif !$actvrecommlist}][{ $oxcmp_user->oxuser__oxfname->value }] [{ $oxcmp_user->oxuser__oxlname->value }][{/if}]" >
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-6">[{ oxmultilang ident="INTRODUCTION" suffix="COLON" }]</label>
        <div class="col-sm-18">
            <textarea class="form-control" rows="8" name="recomm_desc">[{$actvrecommlist->oxrecommlists__oxdesc->value}]</textarea>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-6 col-sm-18">
            <button class="btn btn-primary" type="submit">[{$oViewConf->getRoxidIcon('save')}] [{ oxmultilang ident="SAVE" }]</button>
        </div>
    </div>
</form>
