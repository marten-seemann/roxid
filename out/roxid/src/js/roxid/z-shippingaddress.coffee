$ = jQuery

$.fn.extend
  zShippingAddress: (options) ->
    form = options.form
    editButton = options.editButton
    deleteButton = options.deleteButton
    selectAddr = options.selectAddress
    newAddrButton = options.newAddressButton
    toggleShipAddress = options.toggleShipAddress

    # catch HTML5 form validation errors in the form, if this form is invisible
    # such a validation error would lead to an unsubmittable form, but with no error message for the user
    # solution: if the form contains errors, show it
    checkValidation = ->
      showForm() if form.find(":invalid").length > 0

    # show the form for the separate shipping address
    showForm = ->
      form.disableForm(false).show()
      document.updateValidator()

    # responds to the checkbox which determines if a separate shipping address should be used
    manageShippingAddress = ->
      state = toggleShipAddress.is(':checked') # false if a separate shipping address should be used
      $(toggleShipAddress.data("toggle")).toggle !state
      form.disableForm state
      document.updateValidator()
      unless state then checkValidation()

    # reset the shipping address form
    emptyForm = ->
      form.find('input[type=text]').val('')
      form.find('input[type=radio]').prop('checked', null)
      form.find('select option').prop('selected', null)
      form.find('select option[value=\'\']').prop('selected', 'selected')

    # only execute if the current page is a page with a shipping address form
    if toggleShipAddress.length then manageShippingAddress()

    editButton.bind 'click', ->
      showForm()
      false

    deleteButton.bind 'click', (ev) ->
      btn = this
      ev.preventDefault()
      bootbox.confirm
        message: $lang.DELETE_SHIPPING_ADDRESS_CONFIRMATION
        buttons:
          confirm:
            label: $lang.DELETE_SHIPPING_ADDRESS
            className: 'btn-danger'
          cancel:
            label: $lang.CANCEL
        callback: (result) ->
          return unless result
          addrID = $(btn).data("oxaddressid")
          $("form[name='delete_shipping_address_modal_form_#{addrID}']").submit()
          false
      false

    toggleShipAddress.bind 'change', ->
      manageShippingAddress()
      
    newAddrButton.bind 'click', (ev) ->
      emptyForm()
      selectAddr.filter('[value=-1]').prop('checked', true).trigger 'change'
      ev.preventDefault()
      false

    # when selecting a new address, reload the page
    selectAddr.bind 'change', (ev) ->
      if $(ev.currentTarget).val() == "-1"
        emptyForm()
        showForm()
        return false
      form.hide()
      # allow reloading even if the form is currently invalid
      $("form[data-toggle='roxid-validator']").data("bs.validator").destroy()
      $("form[name='order'] input[name=cl]").val($("input[name=changeClass]").val())
      $("form[name='order'] input[name=fnc]").val("")
      $("form[name='order']").submit()
