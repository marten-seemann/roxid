[{if !$editable }]
    [{if $basketitem->getPersParams()}]
        <div class="z-pers-param-box">
            [{foreach key=sVar from=$basketitem->getPersParams() item=aParam name=persparams }]
                [{if !$smarty.foreach.persparams.first}]<br />[{/if}]
                <strong>
                    [{if $smarty.foreach.persparams.first && $smarty.foreach.persparams.last}]
                        [{ oxmultilang ident="LABEL" suffix="COLON" }]
                    [{else}]
                        [{ $sVar }] :
                    [{/if}]
                </strong> [{ $aParam }]
            [{/foreach}]
        </div>
    [{/if}]
[{else}]
    [{if $basketproduct->oxarticles__oxisconfigurable->value}]
        [{if $basketitem->getPersParams()}]
            <div class="z-pers-param-box form-horizontal">
                [{foreach key=sVar from=$basketitem->getPersParams() item=aParam name=persparams }]
                    <div class="form-group">
                        <label class="control-label col-md-7 col-lg-6">
                            [{if $smarty.foreach.persparams.first && $smarty.foreach.persparams.last}]
                                [{ oxmultilang ident="LABEL" suffix="COLON" }]
                            [{else}]
                                [{ $sVar }]:
                            [{/if}]
                        </label>
                        <div class="col-md-17">
                            <input class="form-control persParam z-pers-param" type="text" name="aproducts[[{ $basketindex }]][persparam][[{ $sVar }]]" value="[{ $aParam }]">
                        </div>
                    </div>
                [{/foreach }]
            </div>
        [{else}]
            <div class="z-pers-param-box form-horizontal">
                <div class="form-group">
                    <label class="control-label col-md-7 col-lg-6">[{ oxmultilang ident="LABEL" suffix="COLON" }]</label>
                    <div class="col-md-17">
                        <input class="input-medium form-control persParam z-pers-param" type="text" name="aproducts[[{ $basketindex }]][persparam][details]" value="">
                    </div>
                </div>
            </div>
        [{/if}]
    [{/if}]
[{/if}]
