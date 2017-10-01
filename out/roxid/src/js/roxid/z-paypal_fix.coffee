$ = jQuery

$.fn.extend
  zPaypalFix: () ->
    $el = $(this)

    # deals with the Express Checkout button
    fixHelpBox = ->
      $helpbox = $el.find(".paypalHelpBox")
      text = $.trim $helpbox.html()
      $helpbox.remove()
      $helpicon = $el.find(".paypalHelpIcon")
      $helpicon.attr("data-toggle", "popover").attr("data-content", text)
      $helpicon.popover
        placement: 'top'
        # container: 'body'
        trigger: 'hover'

    # deals with the payment method Paypal during checkout
    fixPaymentMethod = ->
      $input = $("#payment_oxidpaypal")
      $dl = $input.parents "dl"
      $label = $input.siblings "label"
      text = $label.text()
      $label.remove()
      $input.wrap("<label class='radio'></label>").after(text)
      $dl.find('.paypalPaymentDesc').addClass('help-block').removeClass('paypalPaymentDesc')

    fixHelpBox()
    fixPaymentMethod()
