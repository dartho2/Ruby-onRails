# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.aa.
# You can use CoffeeScript in this file: http://coffeescript.org/
bind = (input_field) ->
  console.log('p')
  $('input[data-role="item-price-magazine"]').blur update_price_b
  $('input[data-role="item-price-n-magazine"]').blur update_price_n

update_price_b = ->
    row = $(this).parents('#js-item-product')
    price_b = row.find('input[data-role="item-price-magazine"]').val() * (1.23)
    price_b = price_b.toFixed(2)
  #  a = row.find('input[data-role="item-price-magazine"]').html()
  #  a = a.toFixed(2)
    row.find('input[data-role="item-price-n-magazine"]').val(price_b)
    console.log('b => n' , price_b)

update_price_n = ->
    row = $(this).parents('#js-item-product')
    price_n = row.find('input[data-role="item-price-n-magazine"]').val() / (1.23)
    price_n = price_n.toFixed(2)
    console.log('n => b' , price_n)
    #  a = row.find('input[data-role="item-price-magazine"]').html()
    #  a = a.toFixed(2)
    row.find('input[data-role="item-price-magazine"]').val(price_n)

get_id_prefix = (input_field) ->
  id_prefix = input_field.attr('id')
  id_prefix = id_prefix.substring(0, id_prefix.lastIndexOf('_'))

$(document).ready ->
    bind $(this)


jQuery(document).ready ($) ->
  $('body').on 'click', '.remove_fields', ->
    console.log('pppp')
    $(this).parents('#aa-item-product').remove()
    if $('.delete').length < 2
      $('.delete').hide()
    return

#  $('#radioBtn a').on 'click', ->
#    row = $(this).parents('#new_invoice')
#    sel = $(this).data('title')
#    tog = $(this).data('toggle')
#    $('#' + tog).prop 'value', sel
#    $('a[data-toggle="' + tog + '"]').not('[data-title="' + sel + '"]').removeClass('active').addClass 'notActive'
#    $('a[data-toggle="' + tog + '"][data-title="' + sel + '"]').removeClass('notActive').addClass 'active'

$(document).ready ->
  $('body').on 'click', '#radioBtn a', (e) ->
    sel = $(this).data('title')
    tog = $(this).data('toggle')
    row = $(this).parents('#new_invoice')
    row1 = $(this).parentsUntil($('#aa-items-table'))
    $('#' + tog).prop 'value', sel
    $('a[data-toggle="' + tog + '"]').not('[data-title="' + sel + '"]').removeClass('active').addClass 'notActive'
    $('a[data-toggle="' + tog + '"][data-title="' + sel + '"]').removeClass('notActive').addClass 'active'
    return
  return


jQuery(document).ready ($) ->
  form = $('form[id="new_invoice"]')
  form.find('[data-role="item-description"]').each () ->
    console.log('asd')
    init_invoice_item_autocomplete_magazine $(this)


#  updatePrice = (val) ->
#  $('#dare_price').val val
#  $('#dare_price').trigger 'change'
#  return
#  updatePriceMagazine = ->
#    price = $('data-role="item-price-magazine"]').val()
#    console.log price
#    $('input[data-role="item-price-i-magazine"]').val price
#    return

  #  $('input[data-role="item-price-magazine"]').change ->
#    console.log('i-p-m')
#    price = Number($(this).val())
#    console.log(price)
#    $('input[data-role="item-price-i-magazine"]').val price

#  $('input[data-role="item-price-magazine"]').change ->
#    console.log('i-p-m')
#    $this = $(this)
#    $clone = $this.clone()
#    $this.after($clone).appendTo('input[data-role="item-price-i-magazine"]')
#    return
#  $('input[data-role="item-price-magazine"]').change ->
#    console.log('i-p-m')
#    $('input[data-role="i tem-price-i-magazine"]').val $(this).val()
#    return


  form.on 'cocoon:after-insert', (e, item) ->
    if item.hasClass 'js-payment'
      date_item = item.find 'input[name*=date]'
      date_item.val (new Date).toISOString().substr 0, 10
    else if item.hasClass 'js-item'
      init_invoice_item_autocomplete_magazine item.find('[data-role="item-description"]')
      bind()
#      updatePriceMagazine
#      tax_selector = item.find('[data-role="taxes-selector"]')
#      tax_selector.trigger('update')

#updatePrice = (val) ->
#  $('input[data-role="item-price-magazine"]').val val
#  $('input[data-role="item-price-i-magazine"]').trigger 'change'
#  return

init_invoice_item_autocomplete_magazine = (input_field) ->
  id_prefix = get_id_prefix input_field
#  cat_buy_prefix = get_cat_buy_prefix input_field
  input_field.autocomplete source: '/panel/magazines/autocomplete.json', select: (event, ui) ->
    $("##{id_prefix}_id").val ui.item.id
    $("##{id_prefix}_id").trigger "change" # to trigger recalculations
    $("##{id_prefix}_cat_buy").val ui.item.cat_buy
    $("##{id_prefix}_cat_buy").trigger "change" # to trigger recalculations
#    $("##{id_prefix}_price").val ui.item.price
#    $("##{id_prefix}_price").trigger "change" # to trigger recalculations
#    $("##{id_prefix}_quantity").val('1').html update_price
#    $("##{id_prefix}_quantity").trigger "change"


