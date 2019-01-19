[{if $oViewConf->getViewThemeParam('blToBasketAjax') && $oViewConf->getViewThemeParam('iNewBasketItemMessage') == 1}]
    [{capture name="tobasketajax" assign="tobasketajax"}]
      $(document).ready(function() {
        [{* need to get the link from the href, since oxgetseourl emits & as &amp; *}]
        var basket_link = $("<a href='[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket" }]'></a>").attr("href");
        $("body").zToBasketAjax({
          basket_link: basket_link,
          basket_icon: "[{$oViewConf->getRoxidIcon('basket')|@addslashes}]",
          back_icon: "[{$oViewConf->getRoxidIcon('undo')|@addslashes}]",
        });
      });
    [{/capture}]
    [{oxscript add=$tobasketajax}]
[{/if}]
