[{assign var="showMobileNavbarOnTablet" value=$oViewConf->getViewThemeParam('blShowMobileNavbarOnTablet')}]

[{if $oxcmp_user}]
  <li class="visible-xs [{if $showMobileNavbarOnTablet}]visible-sm[{/if}]">
    <a href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account" }]" rel="nofollow">
      <span class="z-navbar-icon">[{$oViewConf->getRoxidIcon('user')}]</span>
      <span>[{oxmultilang ident="LAYOUT_HEADER_ACCOUNT_LINK"}]</span>
    </a>
  </li>
[{else}]
  <li class="visible-xs [{if $showMobileNavbarOnTablet}]visible-sm[{/if}]">
    <a href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account" }]" rel="nofollow">
      <span class="z-navbar-icon">
        [{$oViewConf->getRoxidIcon('login')}]
        <span>[{ oxmultilang ident="LOGIN" }]</span>
      </span>
    </a>
  </li>
[{/if}]
