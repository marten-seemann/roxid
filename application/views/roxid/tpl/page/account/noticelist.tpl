[{capture append="oxidBlock_content"}]
    <div class="page-header">
        <h1>[{ $oView->getTitle() }]</h1>
    </div>

    [{if $oView->getNoticeProductList() }]
        [{include file="widget/product/list.tpl" type="line" listId="noticelistProductList" title="" products=$oView->getNoticeProductList() removeFunction="tonoticelist" owishid=$oxcmp_user->oxuser__oxid->value}]
    [{else}]
        <div class="alert alert-info">
          [{ oxmultilang ident="WISH_LIST_EMPTY" }]
        </div>
    [{/if}]
[{/capture}]
[{capture append="oxidBlock_sidebar"}]
    [{include file="page/account/inc/account_menu.tpl" active_link="noticelist"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]
