[{oxhasrights ident="TOBASKET"}]
    [{if !$oDetailsProduct->isNotBuyable()}]
        [{if $oViewConf->getViewThemeParam('blShowProductAmountControls')}]
            [{oxscript add="$('.z-to-basket-with-controls .input-group').ProductAmountControls();"}]
            <div class="z-to-basket-with-controls">
                <div class="input-group">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button" value="minus"><i class="fa fa-minus"></i></button>
                    </span>
                    <input id="amountToBasket" type="number" name="am" value="1" size="3" autocomplete="off" class="form-control">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button" value="plus"><i class="fa fa-plus"></i></button>
                    </span>
                </div>
                <button id="z-toBasket" type="submit" [{if !$blCanBuy}]disabled="disabled"[{/if}] class="btn btn-success">[{$oViewConf->getRoxidIcon('to_basket')}] [{oxmultilang ident="TO_CART"}]</button>
            </div>
        [{else}]
            <div class="z-to-basket-no-controls">
                <div class="input-group pull-right">
                    <input id="amountToBasket" type="number" name="am" value="1" size="3" autocomplete="off" class="form-control input-xxxmini" [{if !$blCanBuy}]disabled[{/if}]>
                    <span class="input-group-btn">
                        <button id="z-toBasket" type="submit" [{if !$blCanBuy}]disabled="disabled"[{/if}] class="btn btn-success">[{$oViewConf->getRoxidIcon('to_basket')}] [{oxmultilang ident="TO_CART"}]</button>
                    </span>
                </div>
            </div>
        [{/if}]
    [{/if}]
[{/oxhasrights}]
