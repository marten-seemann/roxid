[{if $oViewConf->getViewThemeParam('blToBasketAjax') && $oViewConf->getViewThemeParam('iNewBasketItemMessage') == 1}]
    [{capture name="tobasketajax" assign="tobasketajax"}]
      $(document).ready(function() {
        $("body").zToBasketAjax({
          basket_link: "[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket" }]",
          basket_icon: "[{$oViewConf->getRoxidIcon('basket')|@addslashes}]",
          back_icon: "[{$oViewConf->getRoxidIcon('undo')|@addslashes}]",
        });
      });
    [{/capture}]
    [{oxscript add=$tobasketajax}]
[{/if}]
