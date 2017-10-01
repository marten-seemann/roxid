[{ oxmultilang ident="HAVE_YOU_FORGOTTEN_PASSWORD" }]
[{ oxmultilang ident="HERE_YOU_SET_UP_NEW_PASSWORD" }]<br><br>

[{ $oViewConf->getHiddenSid() }]
[{ $oViewConf->getNavFormParams() }]
<input type="hidden" name="fnc" value="forgotpassword">
<input type="hidden" name="cl" value="forgotpwd">
<input type="hidden" name="actcontrol" value="forgotpwd">
<div class="form-horizontal">
  <div class="form-group">
    <label class="control-label [{if $modal}]col-lg-8[{else}]col-lg-4 col-md-5 col-sm-6[{/if}]">[{ oxmultilang ident="YOUR_EMAIL_ADDRESS" suffix="COLON" }]</label>
    <div class="[{if $modal}]col-lg-16[{else}]col-lg-10 col-md-12 col-sm-14[{/if}]">
      <input id="forgotPasswordUserLoginName[{$idPrefix}]" type="email" name="lgn_usr" value="[{$oView->getActiveUsername()}]" class="form-control" required>
      <div class="help-block with-errors"></div>
    </div>
  </div>
  <p>[{ oxmultilang ident="REQUEST_PASSWORD_AFTERCLICK" }]</p>
</div>
[{if !$modal}]
  [{oxifcontent ident="oxforgotpwd" object="oCont"}]
    <div class="z-forgotpwd-text">
      [{ $oCont->oxcontents__oxcontent->value }]
    </div>
  [{/oxifcontent}]
[{/if}]
