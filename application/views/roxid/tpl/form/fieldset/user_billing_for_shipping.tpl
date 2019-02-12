<div class="form-group">
    <label class="control-label col-lg-10 col-md-12 col-sm-8 col-xs-14" for="showShipAddress">[{ oxmultilang ident="USE_BILLINGADDRESS_FOR_SHIPPINGADDRESS" suffix="COLON"}]</label>
    <div class="col-lg-14 col-md-12 col-sm-16 col-xs-10">
        <input type="checkbox" name="blshowshipaddress" id="showShipAddress" [{if !$oView->showShipAddress()}]checked[{/if}] value="0" data-toggle="#shippingAddress">
    </div>
</div>
