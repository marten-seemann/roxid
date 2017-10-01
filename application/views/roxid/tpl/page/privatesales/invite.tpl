[{oxid_include_widget cl="oxwCookieNote" _parent=$oView->getClassName() nocookie=1}]
[{capture append="oxidBlock_content"}]
    <div class="page-header">
        <h1>[{ $oView->getTitle() }]</h1>
    </div>

    <form class="form-horizontal" action="[{ $oViewConf->getSslSelfLink() }]" method="post" data-toggle="roxid-validator">
        [{if !$oView->getInviteSendStatus()}]
            <ul>
                <li>[{ oxmultilang ident="MESSAGE_INVITE_YOUR_FRIENDS" }]</li>
                <li>[{ oxmultilang ident="MESSAGE_INVITE_YOUR_FRIENDS_EMAIL" }]</li>
            </ul>
            [{oxifcontent ident="oxsecurityinfo" object="oCont"}]
                <p>[{ oxmultilang ident="MESSAGE_READ_DETAILS" }] <a href="[{ $oCont->getLink() }]" rel="nofollow">[{ $oCont->oxcontents__oxtitle->value }]</a></p>
            [{/oxifcontent}]
            [{include file="form/privatesales/invite.tpl"}]
        [{else}]
            <span class="alert alert-success">[{ oxmultilang ident="MESSAGE_INVITE_YOUR_FRIENDS_INVITATION_SENT" }]</span>
        [{/if}]
        <button class="btn btn-primary" type="submit">[{$oViewConf->getRoxidIcon('invite')}] [{ oxmultilang ident="SEND" }]</button>
    </form>
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]
