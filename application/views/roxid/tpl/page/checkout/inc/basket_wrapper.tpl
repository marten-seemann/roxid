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
                        [{include file="page/checkout/inc/basket_vouchers.tpl"}]
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
