[{capture append="oxidBlock_content"}]
    <div class="page-header">
      <h1>[{ $oView->getTitle() }]</h1>
    </div>
    <div class="cmsContent">
        <p>
            [{oxifcontent ident="oxcookiesexplanation" object="oCont"}]
                [{$oCont->oxcontents__oxcontent->value}]
            [{/oxifcontent}]
        </p>
    </div>
[{/capture}]
[{include file="layout/page.tpl"}]
