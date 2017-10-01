[{capture append="oxidBlock_content"}]
    <div class="page-header">
        <h1>[{ $oView->getTitle() }]</h1>
    </div>

    [{include file="widget/locator/listlocator.tpl" place="top" locator=$oView->getPageNavigation() sort=true}]

    <div>
        [{include file="form/guestbook.tpl"}]
        <dl>
            [{if $oView->getEntries()}]
                [{foreach from=$oView->getEntries() item=entry}]
                    <dt class="clear item">
                        <span>[{ $entry->oxuser__oxfname->value }] [{oxmultilang ident="WRITES" suffix="COLON"}] <span>[{$entry->oxgbentries__oxcreate->value|date_format:"%d.%m.%Y"}] [{ $entry->oxgbentries__oxcreate->value|date_format:"%H:%M" }]<span></span></span>
                    </dt>
                    <dd>
                        <div class="description">[{ $entry->oxgbentries__oxcontent->value|nl2br }]</div>
                        <hr>
                    </dd>
                [{/foreach}]
            [{else}]
                <dt>
                    [{oxmultilang ident="NO_ENTRY_AVAILABLE"}]
                </dt>
                <dd></dd>
            [{/if}]
        </dl>
        [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigation() place="bottom"}]
    </div>
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]
