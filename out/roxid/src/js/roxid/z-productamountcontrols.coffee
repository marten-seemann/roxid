(($, window) ->
  class ProductAmountControls
    constructor: (el, options) ->
      # @options = $.extend({}, @defaults, options)
      @$el = $(el)
      @$input = $(el).find('input')
      @$plus = @$el.find('button[value=\'plus\']')
      @$minus = @$el.find('button[value=\'minus\']')
      @disableButtons()

      @$input.bind 'change', (ev) =>
        @disableButtons()

      @$el.find('button').bind 'click', (ev) =>
        el = $(ev.currentTarget)
        dir = $(el).val()
        amount = parseFloat @$input.val()
        if dir == "plus" then @$input.val(amount + 1)
        else if dir == "minus" then @$input.val(Math.max(1 , amount - 1))
        @disableButtons()

    # disable minus button when the amount cannot be reduced any further
    disableButtons: ->
      amount = @$input.val()
      @$input.val Math.abs(amount) # when someone enters a negative amount...
      if amount <= 1 then @$minus.attr('disabled', 'disabled')
      else @$minus.removeAttr('disabled')


  $.fn.extend ProductAmountControls: (option, args...) ->
    @each ->
      $this = $(this)
      data = $this.data('productAmountControls')

      if !data
        $this.data 'ProductAmountControls', (data = new ProductAmountControls(this, option))
      if typeof option == 'string'
        data[option].apply(data, args)

) window.jQuery, window
