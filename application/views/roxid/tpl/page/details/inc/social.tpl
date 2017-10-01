[{if ( $oView->isActive('FbShare') || $oView->isActive('FbLike') && $oViewConf->getFbAppId() ) }]
    <div class="social z-social pull-right">
        [{ if $oView->isActive('FacebookConfirm') && !$oView->isFbWidgetVisible()  }]
            <div id="productFbShare"></div>
            <div id="productFbLike">
                [{include file="widget/facebook/enable.tpl" source="widget/facebook/share.tpl" ident="#productFbShare"}]
                [{include file=widget/facebook/like.tpl assign="fbfile"}]
                [{assign var='fbfile' value=$fbfile|strip|escape:'url'}]
                [{oxscript add="oxFacebook.buttons['#productFbLike']={html:'`$fbfile`',script:''};"}]
            </div>
        [{else}]
            <div id="productFbShare">
                [{include file="widget/facebook/enable.tpl" source="widget/facebook/share.tpl" ident="#productFbShare"}]
            </div>
            <div id="productFbLike">
                [{include file="widget/facebook/enable.tpl" source="widget/facebook/like.tpl" ident="#productFbLike"}]
            </div>
        [{/if}]
        <div class="clear"></div>
    </div>
[{/if}]
