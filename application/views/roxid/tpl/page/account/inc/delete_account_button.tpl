<form name="delete_my_account" action="[{$oViewConf->getSelfActionLink()}]" method="post">
    <div class="hidden">
        [{$oViewConf->getHiddenSid()}]
        <input type="hidden" name="cl" value="account">
        <input type="hidden" name="fnc" value="deleteAccount">
    </div>
    <button id="delete_my_account_button" class="btn btn-danger pull-left" data-toggle="modal" data-target="#delete_my_account_confirmation">
        <i class="fa fa-trash"></i>
        [{oxmultilang ident="DELETE_MY_ACCOUNT"}]
    </button>
    [{capture assign="deleteaccountjs"}]
        $(window).on('load', function() {
            var logoutLink = $(".accountDashboardView").next(".row").find("a[role=\'getLogoutLink\']");
            var deleteButton = $("#delete_my_account_button");

            logoutLink.before(deleteButton);
            deleteButton.show();

            $(deleteButton).bind("click", function(ev) {
                ev.preventDefault();
                var form = $(this).parents("form");
                bootbox.confirm({
                    title: "[{oxmultilang ident="DELETE_MY_ACCOUNT_CONFIRMATION_QUESTION"}]",
                    message: "[{oxmultilang ident="DELETE_MY_ACCOUNT_WARNING"}]",
                    buttons: {
                        cancel: {
                            label: '[{oxmultilang ident="DELETE_MY_ACCOUNT_CANCEL"}]'
                        },
                        confirm: {
                            label: '[{oxmultilang ident="DELETE_MY_ACCOUNT"}]',
                            className: 'btn-danger'
                        }
                    },
                    callback: function (result) {
                        if(!result) { return; }
                        form.submit();
                    }
                });
            });
        });
    [{/capture}]
    [{oxscript add=$deleteaccountjs}]
</form>
