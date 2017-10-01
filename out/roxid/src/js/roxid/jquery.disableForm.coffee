$ = jQuery

$.fn.extend
  disableForm: (state) ->
    form_elements = $(this).find('input, textarea, select')
    if state then $(form_elements).attr 'disabled', 'disabled'
    else $(form_elements).removeAttr 'disabled'
    return this
