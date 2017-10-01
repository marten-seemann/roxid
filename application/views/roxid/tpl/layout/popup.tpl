[{capture append="oxidBlock_pageBody"}]
    <div class="container">
        <div class="row">
            <div id="content" class="col-md-24">
                [{foreach from=$oxidBlock_content item="_block"}][{$_block}][{/foreach}]
            </div>
        </div>
    </div>
[{/capture}]
[{include file="layout/base.tpl"}]
