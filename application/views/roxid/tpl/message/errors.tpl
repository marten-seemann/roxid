[{if count($Errors)>0 && count($Errors.default) > 0}]
<div class="alert alert-danger">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <div class="error-message">
      [{foreach from=$Errors.default item=oEr key=key name=errors}]
        [{if !$smarty.foreach.errors.first}]<br>[{/if}]
        [{ $oEr->getOxMessage()}]
      [{/foreach}]
    </div>
</div>
[{/if}]
