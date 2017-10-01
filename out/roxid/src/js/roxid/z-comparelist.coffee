$ = jQuery

$.fn.extend
  zCompareList: () ->
    $el = $(this)

    for th in $el.find('.z-compare-firstcol')
      td = $(th).siblings()[0]
      height = $(td).outerHeight()
      $(th).outerHeight height

    $el.addClass "scrollable" if $el.width() < $el.children("table").width()

    return @each ()->
