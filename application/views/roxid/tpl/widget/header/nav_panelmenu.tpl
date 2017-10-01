[{if empty($direction)}]
  [{assign var="direction" value="left"}]
[{/if}]

[{capture name="panelmenu_js" assign="panelmenu_js"}]
  var navbars = [];
  var theme = '[{$oViewConf->getViewThemeParam('sMobileNavbarColortheme')}]';
  var extensions = [ 'pageshadow', theme ];

  if('[{$oViewConf->getViewThemeParam('sMobileNavbarPageDim')}]' != 'false') {
    extensions.push('[{$oViewConf->getViewThemeParam('sMobileNavbarPageDim')}]');
  }

  navbars.push({
    position: 'top',
    content: [ 'prev', 'title', 'close' ]
  });

  [{if $oViewConf->getViewThemeParam('blMobileNavbarShowShopName')}]
    navbars.push({
      position: 'bottom',
      'content': [
        '<div class=\'lastrow\'><a>[{ $oxcmp_shop->oxshops__oxname->value }]</a></div>'
      ]
    });
  [{/if}]

  [{if $oViewConf->getViewThemeParam('blMobileNavbarShowContact')}]
    navbars.push({
      position: 'bottom',
      'content': [
        '<div class=\'middlerow\'><a href=\'[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=contact" }]\'>[{$oViewConf->getRoxidIcon('contact')}] [{ oxmultilang ident="CONTACT" }]</a></div>'
      ]
    });
  [{/if}]

  [{if $oViewConf->getViewThemeParam('blMobileNavbarShowAccount')}]
    navbars.push({
      position: 'bottom',
      'content': [
        '<div class=\'middlerow\'><a href=\'[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account" }]\' rel=\'nofollow\'>[{if $oxcmp_user}][{$oViewConf->getRoxidIcon('user')}] [{oxmultilang ident="MY_ACCOUNT"}][{else}][{$oViewConf->getRoxidIcon('login')}] [{ oxmultilang ident="LOGIN" }][{/if}]</a></div>',
      ]
    });
  [{/if}]

  [{if $oViewConf->getViewThemeParam('blMobileNavbarShowBasket')}]
    navbars.push({
      position: 'bottom',
      'content': [
        '<div class=\'middlerow\'><a href=\'[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket" }]\' rel=\'nofollow\'>[{$oViewConf->getRoxidIcon('basket')}] [{ oxmultilang ident="CART" }] <span class=\'z-basket-itemcounter z-basket-itemcount badge badge-info\' [{if $oxcmp_basket->getItemsCount() == 0}]style="display:none;"[{/if}]>[{$oxcmp_basket->getItemsCount()}]</span></a></div>'
      ]
    });
  [{/if}]


  [{assign var="sMobileNavbarPosition" value=$oViewConf->getViewThemeParam('sMobileNavbarPosition')"}]

  $('#panelmenu').show();
  $('#panelmenu').find('.nav').removeClass('nav').removeClass('navbar-nav'); // remove Bootstrap styling
  $('#panelmenu').mmenu({
    currentItem: true,
    counters: [{if $oViewConf->getViewThemeParam('blMobileNavbarShowCounter')}]true[{else}]false[{/if}],
    extensions: extensions,
    navbar: {
      'title': '[{ oxmultilang ident="MOBILE_NAVIGATION_TITLE" }]',
    },
    navbars: navbars,
    iconPanels: true,
    slidingSubmenus: [{if $oViewConf->getViewThemeParam('blMobileNavbarSlidingSubmenus')}]true[{else}]false[{/if}],
    transitionDuration: 200,
    offCanvas: {
      blockUI: true,
      position: '[{$sMobileNavbarPosition}]',
      zposition: '[{if $sMobileNavbarPosition == "left" || $sMobileNavbarPosition == "right"}]back[{else}]front[{/if}]'
    },
  });

  // immediately open the menu when the menu button is touched
  $('.panelmenu-toggle').bind('touchstart', function(ev) {
    ev.preventDefault();
    ev.stopPropagation();
    $(ev.currentTarget).trigger('click');
    return false;
  });
  $('.panelmenu-toggle').bind('click', function(ev) {
    $('#panelmenu').find('.dropdown-menu').removeClass('dropdown-menu');
    $('#panelmenu').find('.dropdown-submenu').removeClass('dropdown-submenu');
  });
[{/capture}]

[{oxscript add=$panelmenu_js}]
