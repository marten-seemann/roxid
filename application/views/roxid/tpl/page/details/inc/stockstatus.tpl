<div class="z-stock-status">
    [{if $oDetailsProduct->getStockStatus() == -1}]
        <span class="z-stock-flag z-stock-not">
            [{$oViewConf->getRoxidIcon('stockflag')}]
            [{if $oDetailsProduct->oxarticles__oxnostocktext->value}]
                [{$oDetailsProduct->oxarticles__oxnostocktext->value}]
            [{elseif $oViewConf->getStockOffDefaultMessage()}]
                [{oxmultilang ident="MESSAGE_NOT_ON_STOCK"}]
            [{/if}]
            [{if $oDetailsProduct->getDeliveryDate()}]
                [{oxmultilang ident="AVAILABLE_ON"}] [{$oDetailsProduct->getDeliveryDate()}]
            [{/if}]
        </span>
    [{elseif $oDetailsProduct->getStockStatus() == 1}]
        <span class="z-stock-flag z-stock-low">
            [{$oViewConf->getRoxidIcon('stockflag')}]
            [{oxmultilang ident="LOW_STOCK"}]
        </span>
    [{elseif $oDetailsProduct->getStockStatus() == 0}]
        <span class="z-stock-flag">
            [{$oViewConf->getRoxidIcon('stockflag')}]
            [{if $oDetailsProduct->oxarticles__oxstocktext->value}]
                [{$oDetailsProduct->oxarticles__oxstocktext->value}]
            [{elseif $oViewConf->getStockOnDefaultMessage()}]
                [{oxmultilang ident="READY_FOR_SHIPPING"}]
            [{/if}]
        </span>
    [{/if}]
</div>
<div class="clear"></div>
