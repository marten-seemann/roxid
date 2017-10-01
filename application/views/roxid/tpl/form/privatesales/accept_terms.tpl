<div>
    <form name="login" action="[{ $oViewConf->getSslSelfLink() }]" method="post" data-toggle="roxid-validator">
        <div>
            [{ $oViewConf->getHiddenSid() }]
            [{ $oViewConf->getNavFormParams() }]
            <input type="hidden" name="fnc" value="login_noredirect">
            <input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
            <input type="hidden" name="tpl" value="[{$oViewConf->getActTplName()}]">
            <input type="hidden" name="oxloadid" value="[{$oViewConf->getActContentLoadId()}]">
            [{if $oView->getArticleId()}]
                <input type="hidden" name="aid" value="[{$oView->getArticleId()}]">
            [{/if}]
            [{if $oView->getProduct()}]
                [{assign var="product" value=$oView->getProduct() }]
                <input type="hidden" name="anid" value="[{ $product->oxarticles__oxnid->value }]">
            [{/if}]
            <input type="hidden" name="ord_agb" value="0">
        </div>
        <div>
            <input id="orderConfirmAgb" type="checkbox" name="ord_agb" value="1">
            <label for="orderConfirmAgb">
                [{oxifcontent ident="oxrighttocancellegend" object="oContent"}]
                    [{ $oContent->oxcontents__oxcontent->value }]
                [{/oxifcontent}]
            </label>
        </div>
        <button id="confirmButton" type="submit" class="btn btn-primary">[{ oxmultilang ident="LOGIN" }]</button>
    </form>
</div>
