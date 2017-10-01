[{if !$oxcmp_user->oxuser__oxpassword->value}]
  <form action="[{ $oViewConf->getSslSelfLink() }]" method="post" data-toggle="roxid-validator">
    [{include file="form/forgotpwd_email_modal.tpl" idPrefix="Popup"}]
  </form>
[{/if}]
