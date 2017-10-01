<label class="radio-inline [{$class}]">
    <input type="radio" name="[{$name}]" value="MR" [{if $value|lower  == "mr"  or $value2|lower == "mr" }]checked="checked"[{/if}] [{if $required}]required[{/if}]>
    [{ oxmultilang ident="MR" }]
</label>
<label class="radio-inline [{$class}]">
    <input type="radio" name="[{$name}]" value="MRS" [{if $value|lower  == "mrs" or $value2|lower == "mrs"}]checked="checked"[{/if}] [{if $required}]required[{/if}]>
    [{ oxmultilang ident="MRS" }]
</label>
[{if $required}]
    <div class="help-block with-errors"></div>
[{/if}]
