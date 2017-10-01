<div class="z-basket-wrapper">
    [{include file="page/checkout/inc/basket_contents.tpl" editable=$editable}]
    <div class="row">
        [{if $editable}]
            <div class="z-basket-additional-actions col-sm-10">
                [{if $oViewConf->getShowGiftWrapping() }]
                    <h4>[{oxmultilang ident="GIFT_OPTION"}]</h4>
                    <p>[{oxmultilang ident="WRAPPING_DESCRIPTION"}]</p>
                    <a class="btn btn-default btn-sm" rel="nofollow" href="#wrapping-modal" data-toggle="modal" title="[{ oxmultilang ident="ADD" }]">[{$oViewConf->getRoxidIcon('gift')}] [{ oxmultilang ident="GIFT_OPTIONS_LINK" }]</a>
                [{/if}]
                [{if $oViewConf->getShowVouchers()}]
                    [{block name="checkout_basket_vouchers"}]
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
                    [{/block}]
                [{/if}]
            </div>
            [{assign var="summary_spansize" value=14}]
        [{else}]
            [{assign var="summary_spansize" value=24}]
        [{/if}]
        <div class="col-sm-[{$summary_spansize}]">
            [{include file="page/checkout/inc/basket_summary.tpl" editable=$editable}]
        </div>
    </div>
</div>
