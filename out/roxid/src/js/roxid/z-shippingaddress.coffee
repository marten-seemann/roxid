$ = jQuery

$.fn.extend
  zShippingAddress: (options) ->
    userChangeBillAddress = $("#userChangeAddress")
    billAddressForm = $("#addressForm")
    billAddressText = $("#addressText")
    showShipAddress = $("#showShipAddress")
    shippingAddress = $("#shippingAddress")
    shippingAddressForm = $("#shippingAddressForm")
    shippingAddressText = $("#shippingAddressText")
    userChangeShippingAddress = $("#userChangeShippingAddress")
    newShippingAddress = $("#newShippingAddress")

    # catch HTML5 form validation errors in the shippingAddressForm, if this form is invisible
    # such a validation error would lead to an unsubmittable form, but with no error message for the user
    # solution: if the form contains errors, show it
    checkValidationShipping = ->
      try # some old browser may not support checkValidity()
        valid_shipping = shippingAddressForm.parents("form")[0].checkValidity()
        showShippingAddressForm() unless valid_shipping
      catch e # thus show the form for old browsers in every case
        showShippingAddressForm()

    # catch HTML5 form validation errors in the billAddressForm, if this form is invisible
    checkValidationBill = ->
      try # some old browser may not support checkValidity()
        valid_bill = billAddressForm.parents("form")[0].checkValidity()
        showBillAddressForm() unless valid_bill
      catch e # thus show the form for old browsers in every case
        showBillAddressForm()

    # show the form for the billing address
    showBillAddressForm = ->
      billAddressForm.disableForm(false).show()
      document.updateValidator()
      billAddressText.hide()
      userChangeBillAddress.hide() # hide the button

    # show the form for the separate shipping address
    showShippingAddressForm = ->
      shippingAddressForm.disableForm(false).show()
      document.updateValidator()
      shippingAddressText.hide()
      userChangeShippingAddress.hide() # hide the button

    # responds to the checkbox which determines if a separate shipping address should be used
    manageShippingAddress = ->
      state = showShipAddress.is(':checked') # false if a separate shipping address should be used
      shippingAddress.toggle !state
      userChangeShippingAddress.toggle !state
      shippingAddressForm.disableForm state
      document.updateValidator()
      unless state then checkValidationShipping()

    # only execute if the current page is a page with a shipping address form
    if showShipAddress.length then manageShippingAddress()

    if billAddressText.length then checkValidationBill()

    userChangeBillAddress.unbind()
    userChangeBillAddress.bind 'click', ->
      showBillAddressForm()
      false

    userChangeShippingAddress.bind 'click', ->
      showShippingAddressForm()
      false

    showShipAddress.bind 'change', ->
      manageShippingAddress()

    newShippingAddress.bind 'click', (ev) ->
      ev.preventDefault()
      userChangeShippingAddress.hide()
      $('.z-delivery-addresses input[value=\'-1\']').attr('checked', true)
      shippingAddressForm.find("input[type=text]").val("")
      false

    shippingAddress.find("input[name=oxaddressid]").bind 'change', ->
      $('form[data-toggle="roxid-validator"]').data("bs.validator").destroy()
      $("form[name='order'] input[name=cl]").val($("input[name=changeClass]").val())
      $("form[name='order'] input[name=fnc]").val("")
      $("form[name='order']").submit()


