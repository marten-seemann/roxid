$.initSelectDropDowns = ->
  $('.variant-dropdown a').oxDropDown()

  $('.z-selectlist .dropdown-menu li a').bind 'click', ->
    el = $(this).parents('.dropdown')
    $(el).removeClass('open')
    $(el).trigger('hide.bs.dropdown')
