<div id="basketVoucher" class="z-basket-voucher">
    <h4>[{oxmultilang ident="COUPONS"}]</h4>
    <form name="voucher" action="[{ $oViewConf->getSelfActionLink() }]" method="post" data-toggle="roxid-validator">
        <div class="couponBox" id="coupon">
            [{foreach from=$Errors.basket item=oEr key=key}]
                [{if $oEr->getErrorClassType() == 'oxVoucherException'}]
                    <div class="alert alert-danger">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        [{ oxmultilang ident="COUPON_NOT_ACCEPTED" args=$oEr->getValue('voucherNr') }]<br>
                        <strong>[{ oxmultilang ident="REASON" suffix="COLON"}]</strong>
                      [{ $oEr->getOxMessage() }]
                    </div>
                [{/if}]
            [{/foreach}]
            [{ $oViewConf->getHiddenSid() }]
            <input type="hidden" name="cl" value="basket">
            <input type="hidden" name="fnc" value="addVoucher">
            <div class="input-group">
                <input type="text" name="voucherNr" class="form-control" placeholder="[{ oxmultilang ident="ENTER_COUPON_NUMBER" }]" required>
                <span class="input-group-btn">
                    <button type="submit" class="btn btn-default"><span class="hidden-sm">[{ oxmultilang ident="SUBMIT_COUPON" }]</span><span class="visible-sm">[{ oxmultilang ident="SUBMIT_COUPON_MOBILE" }]</span></button>
                </span>
            </div>
            <div class="help-block with-errors"></div>
            <input type="hidden" name="CustomError" value='basket'>
        </div>
    </form>
</div>
