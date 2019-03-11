$ = jQuery

$.fn.extend
  zBillingAddress: (options) ->
    form = options.form
    button = options.button
    text = options.text

    # show the form for the billing address
    showForm = ->
      form.disableForm(false).show()
      text.hide()
      button.hide() # hide the button
      document.updateValidator()

    # catch HTML5 form validation errors in the billing form, if this form is invisible
    checkValidation = ->
      showForm() if form.find(":invalid").length > 0

    # Check if the form is valid when loading the site.
    # This might not be the case e.g. when new mandatory fields were added.
    checkValidation()

    # button to change the billing address
    button.bind 'click', (ev) ->
      showForm()
      ev.preventDefault()
      false
