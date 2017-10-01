$.fn.extend
  changeShipping: (options) ->
    $el = $(this)
    $form = $el.parents 'form'

    $el.on 'change', (ev) ->
      oxAjax.ajax(
        $form
        iconPosEl: false
        additionalData:
          renderPartial: 1
        targetEl: $("#z-checkout-shipping-payment")
        onSuccess: (data, params) ->
          content = $("<div>" + data.content + "</div>").find('#z-checkout-shipping-payment')
          $("#z-checkout-shipping-payment").replaceWith content
          document.startValidator()
        onError: -> # if anything fails, just reload the page and hope that the error does not persist ;-)
          document.location.reload()
      )
