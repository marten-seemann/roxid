<form action="[{ $oViewConf->getSslSelfLink() }]" method="post" data-toggle="roxid-validator">
    [{ $oViewConf->getHiddenSid() }]
    <input type="hidden" name="fnc" value="fill">
    <input type="hidden" name="cl" value="newsletter">
    [{if $oView->getProduct()}]
        [{assign var="product" value=$oView->getProduct() }]
        <input type="hidden" name="anid" value="[{ $product->oxarticles__oxnid->value }]">
    [{/if}]
    <label for="footer-newsletter-email">[{ oxmultilang ident="NEWSLETTER" }]</label>
    <div class="input-group">
        <input id="footer-newsletter-email" class="form-control" type="email" name="editval[oxuser__oxusername]" placeholder="[{oxmultilang ident='EMAIL'}]" required>
        <span class="input-group-btn">
            <button class="btn btn-primary" type="submit">[{ oxmultilang ident="SUBSCRIBE" }]</button>
        </span>
    </div>
    <div class="help-block with-errors"></div>
</form>
