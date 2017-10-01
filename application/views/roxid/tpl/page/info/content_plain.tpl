[{capture append="oxidBlock_content"}]
    [{assign var="oContent" value=$oView->getContent()}]
    [{assign var="tpl" value=$oViewConf->getActTplName()}]
    [{assign var="oxloadid" value=$oViewConf->getActContentLoadId()}]
    <div class="page-header">
      <h1>[{ $oView->getTitle() }]</h1>
    </div>
    [{$oView->getParsedContent()}]
[{/capture}]
[{include file="layout/popup.tpl"}]
