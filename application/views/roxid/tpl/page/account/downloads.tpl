[{capture append="oxidBlock_content"}]
    <div class="page-header">
        <h1>[{ $oView->getTitle() }]</h1>
    </div>
    [{if $oView->getOrderFilesList()|count }]
        <div class="z-downloadlist">
            <ul class="list-unstyled">
                [{foreach from=$oView->getOrderFilesList() item="oOrderArticle"}]
                    <li>
                        <dl>
                            <dt>
                                <strong>[{ $oOrderArticle.oxarticletitle }] - [{ oxmultilang ident="ORDER_NUMBER" suffix="COLON" }] [{ $oOrderArticle.oxordernr }], [{ $oOrderArticle.oxorderdate|date_format:"%d.%m.%Y"}]</strong>
                            </dt>
                            [{foreach from=$oOrderArticle.oxorderfiles item="oOrderFile"}]
                                <dd>
                                    [{if $oOrderFile->isPaid() || !$oOrderFile->oxorderfiles__oxpurchasedonly->value  }]
                                        [{if $oOrderFile->isValid() }]
                                            <a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=download" params="sorderfileid="|cat:$oOrderFile->getId() }]" rel="nofollow">[{$oViewConf->getRoxidIcon('downloads')}] [{$oOrderFile->oxorderfiles__oxfilename->value}]</a>
                                            <div class="z-download-details">
                                                [{include file="page/account/inc/file_attributes.tpl"}]
                                            </div>
                                        [{else}]
                                            [{$oOrderFile->oxorderfiles__oxfilename->value}]
                                                <div class="z-download-details">
                                                    [{oxmultilang ident="DOWNLOAD_LINK_EXPIRED_OR_MAX_COUNT_RECEIVED"}]
                                                </div>
                                        [{/if}]
                                    [{else}]
                                        <span>[{$oOrderFile->oxorderfiles__oxfilename->value}]</span>
                                        <div class="z-download-details">
                                            <strong>[{ oxmultilang ident="DOWNLOADS_PAYMENT_PENDING" }]</strong>
                                        </div>
                                    [{/if}]
                                </dd>
                            [{/foreach}]
                        </dl>
                    </li>
              [{/foreach}]
          </ul>
        </div>
    [{else}]
        <div class="box info">
          [{ oxmultilang ident="DOWNLOADS_EMPTY" }]
        </div>
    [{/if}]

[{/capture}]
[{capture append="oxidBlock_sidebar"}]
    [{include file="page/account/inc/account_menu.tpl" active_link="downloads"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]
