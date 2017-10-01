[{capture append="oxidBlock_content"}]
  <div class="page-header">
    <h1>[{ $oView->getTitle() }]</h1>
  </div>

  [{oxid_include_dynamic file="form/recommendation_add.tpl" testid=""}]
[{/capture}]

[{include file="layout/page.tpl" sidebar="Left"}]

