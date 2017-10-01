$ = jQuery

$.fn.extend
  lazyLoader: () ->
    for el in $(this)
      imgurl = $(el).attr("data-original")
      $(el).attr("src", imgurl)
