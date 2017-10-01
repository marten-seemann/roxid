[{if $blOrderRemark}]
    <div class="form-group">
        <label class="control-label col-sm-8">[{ oxmultilang ident="WHAT_I_WANTED_TO_SAY" suffix="COLON"}]</label>
        <div class="col-sm-16">
            <textarea id="orderRemark" cols="60" rows="7" name="order_remark" class="form-control" placeholder="[{ oxmultilang ident="HERE_YOU_CAN_ENETER_MESSAGE" }]">[{$oView->getOrderRemark()}]</textarea>
        </div>
    </div>
[{/if}]
