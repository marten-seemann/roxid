<form class="form-horizontal" action="[{ $oViewConf->getSelfActionLink() }]" name="forgotpwd" method="post" data-toggle="roxid-validator">
  [{if $modal}]
    [{include file="form/forgotpwd_email_modal.tpl" modal=$modal idPrefix=$idPrefix}]
  [{else}]
    [{include file="form/forgotpwd_email_text.tpl" modal=$modal idPrefix=$idPrefix}]
    <button class="btn btn-primary" type="submit">[{ oxmultilang ident="REQUEST_PASSWORD"}]</button>
  [{/if}]
</form>
