[{capture append="oxidBlock_content"}]
  <div class="page-header">
      <h1 id="addressSettingsHeader">[{ $oView->getTitle() }]</h1>
  </div>
  [{block name="account_user_form"}]
      [{include file="form/user.tpl"}]
  [{/block}]
[{/capture}]
[{capture append="oxidBlock_sidebar"}]
	[{include file="page/account/inc/account_menu.tpl" active_link="billship"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]
