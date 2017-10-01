[{capture append="oxidBlock_content"}]
    [{ $oView->setNoPaging() }]

    [{assign var="articleList" value=$oView->getCompArtList() }]
    [{assign var="atributeList" value=$oView->getAttributeList() }]

    <div class="page-header">
        <h1>[{ $oView->getTitle() }]</h1>
    </div>

    [{oxscript add="$('.z-compare-list .z-product-title').dotdotdot();"}]

    [{if $oView->getCompareItemsCnt() > 0 }]
        <div class="z-compare-list">
            <table>
                <tbody>
                    <tr>
                        <th class="z-compare-firstcol z-compare-table-cell-main">&nbsp;</th>
                        [{foreach key=iProdNr from=$articleList item=product name=comparelist}]
                            <td class="z-compare-table-cell-main z-compare-item">
                                <div>
                                    [{if $oView->getCompareItemsCnt() > 1 }]
                                        <div class="z-compare-item-move">
                                            [{if !$product->hidePrev}]
                                                <a id="compareLeft_[{ $product->oxarticles__oxid->value }]" rel="nofollow" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getActiveClassName() params="fnc=moveleft&amp;aid=`$product->oxarticles__oxnid->value`&amp;pgNr="|cat:$oView->getActPage() }]" class="navigation movePrev">&laquo;</a>
                                            [{/if}]
                                            [{ oxmultilang ident="MOVE" }]
                                            [{if !$product->hideNext}]
                                                <a id="compareRight_[{ $product->oxarticles__oxid->value }]" rel="nofollow" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getActiveClassName() params="fnc=moveright&amp;aid=`$product->oxarticles__oxnid->value`&amp;pgNr="|cat:$oView->getActPage() }]" class="navigation moveNext">&raquo;</a>
                                            [{/if}]
                                        </div>
                                    [{/if}]
                                    [{oxid_include_widget cl="oxwArticleBox" _parent=$oView->getClassName() iLinkType=$product->getLinkType() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() _object=$product anid=$product->getId() altproduct=$altproduct iIndex=$smarty.foreach.comparelist.iteration sWidgetType=product sListType=compareitem inlist=$product->isInList() skipESIforUser=1}]
                                </div>
                            </td>
                        [{/foreach}]
                    </tr>
                    <tr>
                        <th class="z-compare-firstcol"><span>[{ oxmultilang ident="PRODUCT_ATTRIBUTES" }]</span></th>
                        [{foreach key=iProdNr from=$articleList item=product name=testArt}]
                            <td class="z-compare-remove">
                                <form action="[{ $oViewConf->getSelfActionLink() }]" method="post">
                                  <div>
                                      [{ $oViewConf->getHiddenSid() }]
                                      [{ $oViewConf->getNavFormParams() }]
                                      <input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
                                      <input type="hidden" name="fnc" value="tocomparelist">
                                      <input type="hidden" name="aid" value="[{ $product->oxarticles__oxid->value }]">
                                      <input type="hidden" name="anid" value="[{ $product->oxarticles__oxnid->value }]">
                                      <input type="hidden" name="pgNr" value="0">
                                      <input type="hidden" name="am" value="1">
                                      <input type="hidden" name="removecompare" value="1">
                                      [{oxhasrights ident="TOBASKET"}]
                                          <button class="btn btn-default btn-sm" id="remove_cmp_[{ $product->oxarticles__oxid->value }]" type="submit" title="[{ oxmultilang ident="REMOVE" }]" name="send">[{$oViewConf->getRoxidIcon('product_compare_remove')}] [{ oxmultilang ident="REMOVE" }]</button>
                                      [{/oxhasrights}]
                                  </div>
                                </form>
                            </td>
                        [{/foreach}]
                    </tr>
                    [{foreach key=sAttrID from=$atributeList item=oAttrib name=CmpAttr}]
                        <tr>
                            <th class="z-compare-firstcol" id="cmpAttrTitle_[{$smarty.foreach.CmpAttr.iteration}]">
                                <span>[{ $oAttrib->title }]:</span>
                            </th>
                            [{foreach key=iProdNr from=$articleList item=product name=fe}]
                                <td>
                                    <div id="cmpAttr_[{$smarty.foreach.CmpAttr.iteration}]_[{ $product->oxarticles__oxid->value }]">
                                        [{if $oAttrib->aProd.$iProdNr && $oAttrib->aProd.$iProdNr->value}]
                                            [{ $oAttrib->aProd.$iProdNr->value }]
                                        [{else}]
                                            -
                                        [{/if}]
                                    </div>
                                </td>
                            [{/foreach}]
                        </tr>
                    [{/foreach}]
              </tbody>
          </table>
      </div>
      [{oxscript add="$('.z-compare-list').zCompareList();"}]
    [{else}]
        <div class="alert alert-info">
            [{ oxmultilang ident="MESSAGE_SELECT_AT_LEAST_ONE_PRODUCT" }]
        </div>
    [{/if}]
[{/capture}]

[{if !$oxcmp_user->oxuser__oxpassword->value}]
    [{include file="layout/page.tpl"}]
[{else}]
    [{capture append="oxidBlock_sidebar"}]
        [{include file="page/account/inc/account_menu.tpl" active_link="compare"}]
    [{/capture}]
    [{include file="layout/page.tpl" sidebar="Left"}]
[{/if}]
