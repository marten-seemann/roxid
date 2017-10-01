$ = jQuery

$.fn.extend
  zCookieNote: () ->
    $el = $(this)
    if !$.cookie("displayedCookiesNotification")
      $el.show()
      $.cookie("displayedCookiesNotification", 1, { path: '/', expires: 30 })

    $el.find('.close').on 'click', ->
      $el.hide()

    return @each ()->

