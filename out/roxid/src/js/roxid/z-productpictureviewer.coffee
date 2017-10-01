$ = jQuery

$.fn.extend
  zProductPictureViewer: (options) ->
    $productPicture = $('#product-picture')
    $morePictures = $('#z-productpictures-more')
    $magnifier = $('.z-product-picture-magnifier')
    $morePictures.find('a:first').addClass 'active'

    initPhotoSwipe = ->
      pswpElement = document.querySelectorAll('.pswp')[0]
      items = []
      for el in $morePictures.find('a')
        items.push
          src: $(el).data 'zoom-image'
          w: $(el).data 'zoom-image-width'
          h: $(el).data 'zoom-image-height'
          title: options.title

      opts =
        index: 0
        shareEl: false
        showHideOpacity: true
        bgOpacity: options.bgOpacity
        getThumbBoundsFn: (index) ->
          thumbnail = $productPicture[0]
          pageYScroll = window.pageYOffset || document.documentElement.scrollTop
          rect = thumbnail.getBoundingClientRect()
          x: rect.left, y: rect.top + pageYScroll, w: rect.height

      getIndex = ->
        el = $morePictures.find('a')
        $(el).index $(el).filter('.active')

      $productPicture.add($magnifier).bind 'click', (event) ->
        event.stopPropagation()
        opts.index = getIndex()
        pswp = new PhotoSwipe pswpElement, PhotoSwipeUI_Default, items, opts
        pswp.init()
        pswp.listen 'close', ->
          index = this.getCurrentIndex()
          $morePictures.find('a').eq(index).trigger 'click'
        false


    initElevateZoom = ->
      elevatezoom_options =
        touchEnabled: false
        galleryActiveClass: 'active'
        zoomWindowOffsetX: 15
        loadingIcon: options.loadingIcon

      $.extend elevatezoom_options,
        switch options.zoomMode
          when "basic"
            cursor: "pointer"
            easing: true
          when "inner"
            zoomType: "inner"
            cursor: "crosshair"
          when "lens"
            zoomType: "lens"
            lensShape: "round"
            lensSize: 200
            lensFadeIn: 200
            lensFadeOut: 200
            containLensZoom: true
          when "disabled"
            zoomEnabled: null
            zoomContainerAppendTo: false

      # disable zooming on touch devices, but use ElevateZoom plugin for the image gallery function
      elevatezoom_options.zoomEnabled = null if Modernizr.touch

      $productPicture.css('cursor', 'pointer') if elevatezoom_options.zoomEnabled is null

      $.extend elevatezoom_options,
        gallery: $morePictures.attr('id')

      $("#product-picture").ezPlus elevatezoom_options
      $(".zoomLens").remove() if Modernizr.touch

    initElevateZoom()
    initPhotoSwipe()

    return @each ()->



