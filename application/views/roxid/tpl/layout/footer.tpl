[{capture name="deliveryinfo" assign="deliveryinfo"}]
    [{oxifcontent ident="oxdeliveryinfo" object="oCont"}]
            <div class="z-deliveryinfo">
            [{if $oView->isVatIncluded()}]
                <a href="[{ $oCont->getLink() }]" rel="nofollow">* [{ oxmultilang ident="PLUS_SHIPPING" }] [{ oxmultilang ident="PLUS_SHIPPING2" }]</a>
            [{else}]
                <a href="[{ $oCont->getLink() }]" rel="nofollow">* [{ oxmultilang ident="PLUS" }] [{ oxmultilang ident="PLUS_SHIPPING2" }]</a>
            [{/if}]
        </div>
    [{/oxifcontent}]
[{/capture}]

[{block name="footer_main"}]
    <footer class="footer">
        <div class="container">
            <div class="row visible-xs">
                <div class="pull-right">
                    [{$deliveryinfo}]
                </div>
            </div>

            <div class="row visible-xs">
                <div class="col-xs-12">
                    [{include file="widget/footer/languages.tpl"}]
                </div>
                <div class="col-xs-12">
                    [{include file="widget/footer/currencies.tpl"}]
                </div>
            </div>

            <div class="row">
                <div class="col-sm-4 col-sm-offset-2 col-xs-12">
                  [{oxid_include_widget cl="oxwServiceList" noscript=1 nocookie=1}]
                </div>
                <div class="col-sm-4 col-xs-12">
                  [{oxid_include_widget cl="oxwInformation" noscript=1 nocookie=1}]
                </div>
                <div class="col-sm-4 hidden-xs">
                  [{oxid_include_widget cl="oxwManufacturerList" _parent=$oView->getClassName() noscript=1 nocookie=1}]
                </div>
                <div class="col-sm-4 hidden-xs">
                  [{oxid_include_widget cl="oxwCategoryTree" _parent=$oView->getClassName() sWidgetType="footer" noscript=1 nocookie=1}]
                </div>

                <div class="col-sm-5 hidden-xs">
                    [{block name="footer_deliveryinfo"}]
                        [{$deliveryinfo}]
                    [{/block}]

                    [{block name="footer_fblike"}]
                        [{if $oView->isActive('FbLike') && $oViewConf->getFbAppId()}]
                            <div class="z-facebook hidden-xs clear" id="footerFbLike">
                                [{include file="widget/facebook/enable.tpl" source="widget/facebook/like.tpl" ident="#footerFbLike" parent="footer"}]
                            </div>
                        [{/if}]
                    [{/block}]

                    [{if $oView->showNewsletter()}]
                        <div class="visible-lg">
                            [{include file="widget/footer/newsletter.tpl"}]
                        </div>
                    [{/if}]
                </div>
            </div>

            <div class="z-footer-lastrow row">
                [{include file="widget/footer/copyright.tpl"}]
                <div class="z-footer-description">
                    [{oxifcontent ident="oxstdfooter" object="oCont"}]
                        [{$oCont->oxcontents__oxcontent->value}]
                    [{/oxifcontent}]
                </div>
            </div>
        </div>
    </footer>
[{/block}]
[{if $oView->isRootCatChanged()}]
    [{oxscript add="$( '#scRootCatChanged' ).oxModalPopup({ target: '#scRootCatChanged', openDialog: true});"}]
    <div id="scRootCatChanged" class="popupBox corners FXgradGreyLight glowShadow">
        [{include file="form/privatesales/basketexcl.tpl"}]
    </div>
[{/if}]
