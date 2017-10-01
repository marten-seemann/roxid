$ = jQuery

$.fn.extend
  zDateInputToDateFields: (opts) ->
    $(this).on 'change', ->
      date = new Date $(this).val()
      day = date.getDate()
      month = date.getMonth() + 1
      year = date.getFullYear()

      unless(isNaN(day) or isNaN(month) or isNaN(year))
        $(opts.day).val(day)
        $(opts.month).val(month)
        $(opts.year).val(year)

    return @each ()->
