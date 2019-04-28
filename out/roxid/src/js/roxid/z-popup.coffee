$ = jQuery

$.fn.extend
  zPopup: (options) ->
    @each ()->
      $el = $(@)
      $el.on 'click', (ev) ->
        ev.preventDefault()
        content = "
          <div class='loader'></div>
          <iframe src='" + $el.data("src") + "'></iframe>
        "
        bootbox.alert
          className: 'z-popup-dialog'
          size: 'large'
          message: content
        $('.z-popup-dialog iframe').on 'load', ->
          $(@).show()
          $('.z-popup-dialog .loader').hide()
        false
