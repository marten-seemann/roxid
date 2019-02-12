$ = jQuery

$.fn.extend
  zBillingAddress: (options) ->
    form = options.form
    button = options.button
    text = options.text

    # catch HTML5 form validation errors in the billing form, if this form is invisible
    checkValidation = ->
      try # some old browser may not support checkValidity()
        showForm() unless form.parents("form")[0].checkValidity()
      catch e # thus show the form for old browsers in every case
        showForm()

    # show the form for the billing address
    showForm = ->
      form.disableForm(false).show()
      text.hide()
      button.hide() # hide the button
      document.updateValidator()

    button.unbind()
    button.bind 'click', (ev) ->
      showForm()
      ev.preventDefault()
      false
