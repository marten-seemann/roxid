[{capture append="oxidBlock_content"}]
<div class="page-header">
  <h1>[{ oxmultilang ident="ERROR" }]</h1>
</div>
<p>
    [{if $sUrl}]
        [{assign var="sModifiedUrl" value=$sUrl|escape }]
        [{assign var="sModifiedUrl" value="<i><strong>'"|cat:$sModifiedUrl|cat:"'</strong></i>"}]
        [{ oxmultilang ident="ERROR_404" args=$sModifiedUrl }]
    [{else}]
        [{ oxmultilang ident="ERROR_404" args=''}]
    [{/if}]
</p>
[{/capture}]
[{include file="layout/page.tpl"}]
