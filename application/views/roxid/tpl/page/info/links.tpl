[{capture append="oxidBlock_content"}]
    <div class="page-header">
        <h1>[{ $oView->getTitle() }]</h1>
    </div>

    [{foreach from=$oView->getLinksList() item=link name=linksList}]
        <div class="z-links">
            <h3>
                <span>[{ $link->oxlinks__oxinsert->value|date_format:"%d.%m.%Y" }] - </span> <a href="[{ $link->oxlinks__oxurl->value }]" >[{ $link->oxlinks__oxurl->value }]</a>
            </h3>
            <div class="z-links-content">[{ $link->oxlinks__oxurldesc->value }]</div>
        </div>
    [{/foreach}]
[{/capture}]

[{include file="layout/page.tpl" sidebar="Left"}]
