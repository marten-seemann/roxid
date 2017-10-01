[{capture append="oxidBlock_pageBody"}]
<div class="page-header">
  <h1>[{ oxmultilang ident="ERROR_MESSAGE_OXID_SHOP_ERROR" }]</h1>
</div>

[{capture append="_error_content"}]
<div>
  <div>[{ oxmultilang ident="ERROR_MESSAGE_OXID_SHOP_ERROR" }]</div>
  <div>[{ oxmultilang ident="MESSAGE_PLEASE_DELETE_FOLLOWING_DIRECTORY" args=$oViewConf->getBaseDir()}]/setup !</div>
</div>
[{/capture}]
[{include file="message/error.tpl" statusMessage=""|implode:$_error_content}]
[{/capture}]
[{include file="layout/base.tpl"}]
