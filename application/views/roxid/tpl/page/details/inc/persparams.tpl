[{if $oView->isPersParam() }]
    <div class="z-persparam clear">
        <div class="form-group">
            <label class="control-label col-xs-7 col-sm-9 col-md-7" for="persistentParam">[{ oxmultilang ident="LABEL" suffix="COLON"}]</label>
            <div class="col-xs-17 col-sm-15 col-md-17"><input type="text" id="persistentParam" class="form-control" name="persparam[details]" value="[{ $oDetailsProduct->aPersistParam.text }]"></div>
        </div>
    </div>
[{/if}]
