<div class="agb">
    [{if $oView->isActive('PsLogin') || !$oView->isConfirmAGBActive()}]
        <input type="hidden" name="ord_agb" value="1">
    [{else}]
        <input type="hidden" name="ord_agb" value="0">
    [{/if}]
    <input type="hidden" name="oxdownloadableproductsagreement" value="0">
    <input type="hidden" name="oxserviceproductsagreement" value="0">

    [{if !$hideButtons}]
        <fieldset>
            [{if !$oView->isActive('PsLogin')}]
                [{if $oView->isConfirmAGBActive()}]
                    [{oxifcontent ident="oxrighttocancellegend" object="oContent"}]
                        <legend>[{$oContent->oxcontents__oxtitle->value}]</legend>
                        <div class="checkbox agbConfirmation">
                            <label for="checkAgbTop">
                                <input id="checkAgbTop" type="checkbox" name="ord_agb" value="1" required>
                                [{$oContent->oxcontents__oxcontent->value}]
                            </label>
                        </div>
                    [{/oxifcontent}]
                [{else}]
                    [{oxifcontent ident="oxrighttocancellegend2" object="oContent"}]
                        <legend>[{$oContent->oxcontents__oxtitle->value}]</legend>
                        <p class="agbConfirmation">
                            [{$oContent->oxcontents__oxcontent->value}]
                        </p>
                    [{/oxifcontent}]
                [{/if}]
            [{/if}]

            [{if $oViewConf->isFunctionalityEnabled('blEnableIntangibleProdAgreement') }]
                [{assign var="oExplanationMarks" value=$oView->getBasketContentMarkGenerator() }]
                [{if $oxcmp_basket->hasArticlesWithDownloadableAgreement() }]
                    [{oxifcontent ident="oxdownloadableproductsagreement" object="oContent"}]
                        <div id="noteForDownloadableArticles" class="checkbox agbConfirmation">
                            <label for="oxdownloadableproductsagreement">
                                <input id="oxdownloadableproductsagreement" type="checkbox" name="oxdownloadableproductsagreement" value="1" required>
                                [{$oExplanationMarks->getMark('downloadable')}] [{$oContent->oxcontents__oxcontent->value}]
                            </label>
                        </div>
                    [{/oxifcontent}]
                [{/if}]
                [{if $oxcmp_basket->hasArticlesWithIntangibleAgreement() }]
                    [{oxifcontent ident="oxserviceproductsagreement" object="oContent"}]
                        <div id="noteForIntangibleArticles" class="checkbox agbConfirmation">
                            <label for="oxserviceproductsagreement">
                                <input id="oxserviceproductsagreement" type="checkbox" name="oxserviceproductsagreement" value="1" required>
                                [{$oExplanationMarks->getMark('intangible')}] [{$oContent->oxcontents__oxcontent->value}]
                            </label>
                        </div>
                    [{/oxifcontent}]
                [{/if}]
            [{/if}]
        </fieldset>
    [{/if}]
</div>

[{oxscript add="$('#checkAgbTop').click(function(){ $('input[name=ord_agb]').val(parseInt($('input[name=ord_agb]').val())^1);});"}]
[{oxscript add="$('#oxdownloadableproductsagreement').click(function(){ $('input[name=oxdownloadableproductsagreement]').val(parseInt($('input[name=oxdownloadableproductsagreement]').val())^1);});"}]
[{oxscript add="$('#oxserviceproductsagreement').click(function(){ $('input[name=oxserviceproductsagreement]').val(parseInt($('input[name=oxserviceproductsagreement]').val())^1);});"}]
