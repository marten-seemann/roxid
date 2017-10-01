$ = jQuery

$.fn.extend
  zToBasketAjax: (options) ->
    settings =
      basket_link: ''
      basket_icon: ''
      back_icon: ''
    settings = $.extend settings, options

    for form in $("form")
      continue unless $(form).find("input[name='fnc']").val() is "tobasket" # only bind to forms which put products into the basket

      $(form).on "submit", (ev)->
        url = $(this).attr "action"
        values = $(this).serializeArray()
        values.push
          name: "useAjax"
          value: true

        toggleSubmitDisabled = (el, state) ->
          $submit = $(el).find("[type='submit']")
          $submit.toggleClass("disabled", state)
          $input = $submit.parents(".input-group").find("input")
          if $input.length
            if state then $input.attr("disabled", "disabled")
            else $input.removeAttr("disabled")

        $.ajax
          url: url
          type: "post"
          data:
            values
          beforeSend: => # disable submit button on click to make the AJAX request visible to the user
            toggleSubmitDisabled(this, true)
          complete: => # re-enable submit button as soon as the request is finished
            toggleSubmitDisabled(this, false)
          success: (data, status, jqxhr) ->
            $msgs = $(data).children(".messages")
            success_text = $.trim $msgs.children(".success").children(".alert").html()
            errors_text = $.trim $msgs.find(".error-message").html()
            counter = $.trim $msgs.children(".itemcount").text()
            price = $.trim $msgs.children(".price").text()

            # set counter of minibasket
            if counter == 0 then $(".z-basket-itemcounter").hide()
            else
              $(".z-basket-itemcounter").show()
              $(".z-basket-itemcount").text(counter)

            # set price of minibasket
            $(".z-basket-price").show()
            $(".z-basket-price").text(price)

            if errors_text.length > 0
              bootbox.dialog
                className: 'modal-danger'
                title: $lang.BASKET_ERROR
                message: errors_text
            else if success_text.length > 0
              box = bootbox.dialog
                title: success_text
                message: $(data).children(".basket").html()
                className: 'z-minibasket-modal'
                buttons:
                  continueshopping:
                    className: 'btn-default'
                    label: settings.back_icon + " " + $lang.TO_BASKET_CONTINUE_SHOPPING
                    callback: -> return # do nothing, just close this modal
                  tobasket:
                    className: 'btn-success'
                    label: settings.basket_icon + " " + $lang.TO_BASKET_DISPLAY_BASKET
                    callback: ->
                      window.location.href = settings.basket_link
              box.on 'shown.bs.modal', ->
                $el = $(this)
                $el.children('.modal-backdrop').on 'click', ->
                  $el.modal('hide')
                # $el.find('.modal-backdrop').height $(window).height()
                $el.find('.modal-body').css('max-height', 0.7*window.innerHeight + 'px')

          error: => # in case of an error (not an OXID error, but e.g. a connection error), try submitting the form without all the AJAX luxury
            $(this).off("submit").trigger("submit")

        return false
