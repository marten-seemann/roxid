[{if $oView->isActive('FbLike') && $oViewConf->getFbAppId()}]
    <fb:like href="[{if $parent != 'footer'}][{$oView->getCanonicalUrl()}][{else}][{$oViewConf->getCurrentHomeDir()}][{/if}]" class="fb-like" layout="button" action="like" colorscheme="light"></fb:like>
[{/if}]
