$.fn.extend
  ajaxBasket: (options) ->
    pageContent = $('#content')
    basketForm = null

    init = () ->
      basketForm = pageContent.find('form[name="basket"]').first()
      basketForm.bind 'submit', (ev) ->
        false

      # initialize the triggers
      buttons = basketForm.find('.z-quantity button')
      buttons.unbind 'click'
      buttons.bind 'click', (ev) ->
        el = $(ev.currentTarget)
        dir = el.val() # plus or minus
        input = el.parents('.z-quantity').find('input')
        if dir == "plus"
          input.val parseInt(input.val()) + 1
        else
          if input.val() > 1 then input.val parseInt(input.val()) - 1
        disableMinusButtons()
        save()

      basketForm.find('.z-quantity input').bind 'focus', (ev) ->
        $el = $(ev.currentTarget)
        $el.data('val-before', $el.val())

      basketForm.find('.z-quantity input').bind 'change', (ev) ->
        $el = $(ev.currentTarget)
        value = parseInt($el.val())
        if value is 0
          val = showDeleteConfirmDialog($el, $el.data('val-before'))
          return
        if(value < 0) then $el.val(-value) # prevent negative amounts
        disableMinusButtons()
        save()

      basketForm.find('.z-pers-param').bind 'change', (ev) ->
        save()

      basketForm.find('.z-selectlist .z-variant-dropdown').on 'hide.bs.dropdown', ->
        save()

      pageContent.trigger( "change" )

      basketForm.find('.z-basket-remove').bind 'click', (ev) ->
        el = $(ev.currentTarget)
        quantity_input = el.parents('td').find('.z-quantity').find('input')
        showDeleteConfirmDialog(quantity_input, quantity_input.val())

    # disable the minus buttons if the quantity is less or equal than one (reducing it further would lead to 0 or negative quantities)
    disableMinusButtons = ->
      for el in basketForm.find('.z-quantity')
        minus_button = $(el).find('button[value="minus"]')
        if parseInt($(el).find('input').val()) <= 1
          minus_button.attr('disabled', 'disabled')
        else
          minus_button.removeAttr('disabled')
      true

    # send the form via AJAX to the server and display the updated basket
    save = ->
      oxAjax.ajax(
        basketForm
        targetEl: [ $(basketForm).find("table.z-basket"), $("#basketSummary table") ]
        iconPosEl: false
        additionalData:
          renderPartial: 1
          updateBtn: true
        onSuccess: (data, params) ->
          pageContent.html data.content
          $.initSelectDropDowns()
          updateMinibasket()
          init()
          disableMinusButtons()
      )

      basketForm.find('input, textarea, button').attr('disabled', 'disabled')
      # basketForm.find('.btn').addClass('.btn-disabeld')

    # confirm dialog: "Do you really want to delete product from basket?"
    # param reset_value: if the user clicks "cancel", then the amount input will be set to this value
    showDeleteConfirmDialog = (quantity_input, reset_value) ->
      bootbox.confirm
        message: $lang.BASKET_REMOVE_TEXT
        closeButton: false
        size: 'small'
        buttons:
          cancel:
            label: $lang.BASKET_REMOVE_CANCEL
          confirm:
            className: 'btn-danger'
            label: $lang.BASKET_REMOVE_OK
        callback: (arg) ->
          if arg # ok
            quantity_input.val(0)
            save()
          else # cancel
            quantity_input.val(reset_value)


    updateMinibasket = ->
      counter = parseInt($("#basket_item_count").val())
      price = $("#basket_total_price").val()
      if isNaN(counter) then counter = 0
      $(".z-basket-itemcount").text(counter)
      if counter == 0 then $(".z-basket-itemcounter").hide()
      price = '' unless price?
      $(".z-basket-price").text(price)

    init()
    disableMinusButtons()
