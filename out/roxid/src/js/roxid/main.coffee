$ ->
  # apply dotdotdot at various places
  $('.z-category-box h3').dotdotdot
    wrap: 'letter'

  # start form validator
  $.fn.validator.Constructor.INPUT_SELECTOR += ':enabled:visible'
  document.startValidator = ->
    forms = $('form[data-toggle="roxid-validator"]')
    forms.validator { disable: false } if forms.length > 0

  document.updateValidator = ->
    forms = $('form[data-toggle="roxid-validator"]')
    forms.data("bs.validator").update() if forms.length > 0

  document.startValidator()

  # make the category tree interactive
  $('.z-category-tree .icon').on 'click', (event) ->
    $(event.currentTarget).parents('li').first().toggleClass 'exp-js'
    false


  # initialize owlCarousels
  document.initOwlCarousels = ->
    $("div[data-carousel='owl']").each ->
      breakpoints =
        lg: 1200
        md: 992
        sm: 768
      responsive = {}
      for size in [ 'lg', 'md', 'sm' ]
        setting = parseInt $(this).data("slides-#{size}")
        if setting
          val = breakpoints[size]
          responsive[val] =
            items: setting

      $(this).addClass('owl-carousel')

      $(this).owlCarousel
        autoHeight: false
        items: parseInt $(this).data('slides')
        dots: false
        nav: true
        navRewind: false
        loop: !!$(this).data('loop')
        navText: [
          '<i class="fa fa-chevron-left"></i>'
          '<i class="fa fa-chevron-right"></i>'
        ]
        pagination: false
        responsive: responsive
        stagePadding: 15

      $(this).find('.owl-nav').prepend $('<div class="fade-left"></div>')
      $(this).find('.owl-nav').prepend $('<div class="fade-right"></div>')

  document.initOwlCarousels()

  # workaround for the Paypal Plus module
  $('#paymentNextStepDummyBottom, #paymentNextStepDummyBottomMobile').on 'click', (e) ->
    $('#paymentNextStepBottom').trigger 'click'
    e.stopPropagation()
    return false


  # Dropdown touch fixes
  $('body').on 'touchstart.dropdown', '.dropdown-menu', (e) ->
    e.stopPropagation()

  $('body').on 'touchstart.dropdown.data-api', '.dropdown', (e) ->
    e.stopPropagation()

  # see http://stackoverflow.com/questions/5339161/legend-tag-and-chrome/14800780#14800780
  $('legend + *').not(':visible').each ->
    $('<div class=\"apple_fails\"></div>').insertBefore $(this)
