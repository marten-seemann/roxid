[{assign var="minibasketDisplay" value=$oViewConf->getViewThemeParam('sMinibasketDisplay')}]
[{assign var="showMobileNavOnTablet" value=$oViewConf->getViewThemeParam('blShowMobileNavbarOnTablet')}]

[{capture name="navbar_menu_button" assign="navbar_menu_button"}]
  <span class="z-navbar-menu">
    <i class="fa fa-bars"></i>
    [{ oxmultilang ident="MOBILE_NAVIGATION_BUTTON" }]
  </span>
[{/capture}]

<div id="navigation">
  <nav class="navbar navbar-default navbar-static-top [{if $showMobileNavOnTablet}]z-mobile-nav-on-tablet[{/if}] [{if $oViewConf->getViewThemeParam('sNavbarColorMode')=="inverse"}]navbar-inverse[{/if}]">
    <div class="container">
      <div class="navbar-header">
        [{include file="widget/header/nav_panelmenu.tpl"}]
        <a href="#panelmenu" class="navbar-toggle panelmenu-toggle">
          [{$navbar_menu_button}]
        </a>
      </div>
      <div class="z-navbar-phone hidden-md hidden-lg">
        <ul id="panel-menu" class="nav navbar-nav navbar-right pull-right">
          [{include file="widget/header/nav_mobile.tpl"}]
          [{include file="widget/header/nav_minibasket.tpl" minibasketDisplay="big"}]
        </ul>
      </div>
      [{if $minibasketDisplay=="small"}]
        <div class="visible-lg visible-md">
          <ul class="nav navbar-nav navbar-right">
            [{include file="widget/header/nav_minibasket.tpl" minibasketDisplay=$minibasketDisplay}]
          </ul>
        </div>
      [{/if}]
      <div class="navbar-collapse collapse">
        [{oxid_include_widget cl="oxwCategoryTree" cnid=$oView->getCategoryId() sWidgetType="header" _parent=$oView->getClassName() nocookie=1 mode="bootstrap"}]
        [{if $minibasketDisplay=="big"}]
          <div class="visible-md visible-lg">
            [{include file="widget/header/search.tpl" input_id="searchParam2" mode="navbar"}]
          </div>
        [{/if}]
      </div>
    </div>
  </nav>
  [{if $oView->getClassName() ne "start" && !$blHideBreadcrumb}]
    [{block name="layout_breadcrumb"}]
      [{ include file="widget/breadcrumb.tpl"}]
    [{/block}]
  [{/if}]
</div>
