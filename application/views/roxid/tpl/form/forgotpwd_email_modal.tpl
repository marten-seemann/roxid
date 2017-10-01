<div id="forgot-pwd-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">[{ oxmultilang ident="HAVE_YOU_FORGOTTEN_PASSWORD" }]</h4>
      </div>
      <div class="modal-body">
        [{include file="form/forgotpwd_email_text.tpl" idPrefix=$idPrefix modal=true}]
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">[{ oxmultilang ident="CANCEL"}]</button>
        <button class="btn btn-primary" type="submit">[{ oxmultilang ident="REQUEST_PASSWORD"}]</button>
      </div>
    </div>
  </div>
</div>
