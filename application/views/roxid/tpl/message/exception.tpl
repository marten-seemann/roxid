[{capture append="oxidBlock_pageBody"}]
    <div class="alert alert-danger">
          [{if count($Errors)>0 && count($Errors.default) > 0}]
              [{foreach from=$Errors.default item=oEr key=key }]
                  <p>[{ $oEr->getOxMessage()}]</p>
                  <p class="stackTrace">[{ $oEr->getStackTrace()|nl2br }];</p>
              [{/foreach}]
          [{/if}]
    </div>
[{/capture}]

[{include file="layout/base.tpl"}]
