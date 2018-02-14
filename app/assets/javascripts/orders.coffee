
update_subtotal = ->
  subtotal = 0
  b = undefined

  $('.js-net-val-b').each (i) ->
    price = $(this).html()
    a = parseFloat($('.js-net-vat').html())
    if !isNaN(price)
      subtotal += Number(price)
    return
  subtotal = subtotal.toFixed(2)
  $('.subtotal').html subtotal
  update_balance()
  return

update_balance = ->
  total = (Number($('.subtotal').html()) * (parseFloat($('.js-net-vat').html())/100))
  total = total.toFixed(2)
  total_1 =  Number($('.subtotal').html()) - total
  total_1 = total_1.toFixed(2)
  $('.vat').html total
  $('.netto_price').html total_1
  return

get_id_prefix = (input_field) ->
  id_prefix = input_field.attr('id')
  id_prefix = id_prefix.substring(0, id_prefix.lastIndexOf('_'))
  id_prefix

init_invoice_item_autocomplete = (input_field) ->
  id_prefix = get_id_prefix input_field
  input_field.autocomplete source: '/panel/products/autocomplete.json', select: (event, ui) ->
    $("##{id_prefix}_id").val ui.item.id
    $("##{id_prefix}_id").trigger "change" # to trigger recalculations
    $("##{id_prefix}_price").val ui.item.price
    $("##{id_prefix}_price").trigger "change" # to trigger recalculations
    $("##{id_prefix}_quantity").val('1').html update_price
    $("##{id_prefix}_quantity").trigger "change"

bind = (input_field) ->
  $('input[data-role="quantity"]').blur update_price
  $('input[data-role="price"]').blur update_price
  $('select[data-role="name"]').change update_prices

update_prices = ->
  rows = $(this).parents('.table-list')
  price = rows.find('select[data-role="name"]').val()
  if isNaN(price) then $(this).parents('.table-list').find('.price').html('0') else $(this).parents('.table-list').find('input[data-role="price"]').html(price)
  return

$('body').on 'click', '.remove_fields', ->
  $(this).parents('#js-item-product').remove()
  update_subtotal()
  if $('.delete').length < 2
    $('.delete').hide()
  return

update_price = ->
  row = $(this).parents('#js-item-product')
  price = row.find('input[data-role="quantity"]').val() * row.find('input[data-role="price"]').val()
  price = price.toFixed(2)
  if isNaN(price) then row.find('.js-net-val-b').html('0') else row.find('.js-net-val-b').html(price)
  a = row.find('.js-net-val-b').html()-(row.find('.js-net-val-b').html() * (parseFloat($('.js-net-vat').html())/100))
  a = a.toFixed(2)
  row.find('.js-net-prince-n').html(a)
  update_subtotal()
  return

destroy_invoice_item_autocomplete = (input_field) ->
  if input_field.data 'autocomplete'
    input_field.autocomplete 'destroy'
    input_field.removeData 'autocomplete'

jQuery(document).ready ($) ->

  $('input.custom-control-input').click ->
    inputValue = $(this).attr('value')
    $('.' + inputValue).val(1)
    $('.' + inputValue).toggle()
    return

  form = $('form[data-role="invoice"]')

  form.find('[data-role="item-description"]').each () ->
    init_invoice_item_autocomplete $(this)
    bind $(this)

  form.on 'cocoon:after-insert', (e, item) ->
    if item.hasClass 'js-payment'
      date_item = item.find 'input[name*=date]'
      date_item.val (new Date).toISOString().substr 0, 10
    else if item.hasClass 'js-item'
      init_invoice_item_autocomplete item.find('[data-role="item-description"]')
#      tax_selector = item.find('[data-role="taxes-selector"]')
#      tax_selector.trigger('update')

$ ->
  $('#datepicker').datepicker({ dateFormat: 'dd/mm/yy' })
  return

$ ->
  $('#datepicker1').datepicker({ dateFormat: 'dd/mm/yy' })
  return

$ ->
  $ 'fieldset .add_fields'
  $('fieldset').bind 'cocoon:after-insert', (e, loc) ->
    update_date()
    bind()
    return
  $('fieldset').bind 'cocoon:after-remove', (e, loc) ->
    update_price()
    return
  return

jQuery ->
  $('#datatable-orders').dataTable
    sPaginationType: "full_numbers"
    bProcessing: true
    autoWidth: true




jQuery(document).ready ($) ->
  date_sale = $('form')
  a = date_sale.find('#datepicker').val()
  console.log(a)
  $('input[data-role="data-sale"]').val a
  date_sale.find('#datepicker').each () ->
  bind1 $(this)
  return




bind1 = (input_field) ->
  console.log('vvvv')
  $('input[data-role="datapicker"]').blur update_date

update_date = ->
  console.log('hhhh')
  b = $('form')
  a = b.find('input[data-role="datapicker"]').val()
  console.log(a)
  $('input[data-role="data-sale"]').val a

#jQuery(document).ready ($) ->
#  sum1 = 0
#  sum2 = 0
#  sum3 = 0
#  $roww = $('[data-role="price_total_div"]')
#  $('tr').not(':first').not(':last').each ->
#    getnum = (t) ->
#      isNumeric = (n) ->
#        !isNaN(parseFloat(n)) and isFinite(n)
#      if isNumeric(t)
#        return parseInt(t, 10)
#    sum1 = getnum($(this).find('[data-role="quantity_earning"]').html())
#    sum2 += getnum($(this).find('[data-role="quantity_earning"]').html())* getnum($(this).find('[data-role="price_b_earning"]').html())
#    sum3 = sum1-sum2
#    console.log(sum1)
#    $('[data-role="price_total_div"]').find('p[data-role="price_total"]').html(sum3)
##    $('[data-role="price_total_div"]').find('p[data-role="price_total"]').html(sum2)
#    return

#jQuery(document).ready ($) ->
#  sum1 = 0
#  sum2 = 0
#  sum3 = 0
#  $('[data-role="price_total_div"]').each () ->
#    console.log('b')
##    $('.table tr').each (i) ->
#    $(this).find('.table tr');
#      getnum = (t) ->
#        isNumeric = (n) ->
#          !isNaN(parseFloat(n)) and isFinite(n)
#        if isNumeric(t)
#          return parseInt(t, 10)
#        0
#      sum1 += getnum($(this).find('[data-role="quantity_earning"]').html())
#      sum2 += getnum($(this).find('[data-role="quantity_earning"]').html())* getnum($(this).find('[data-role="price_b_earning"]').html())
#      sum3 = sum1-sum2
#      console.log(sum1)
#    $(this).find('#sum1').html(sum1)
#  #    $('[data-role="price_total_div"]').find('p[data-role="price_total"]').html(sum2)
#    return
#jQuery(document).ready ($) ->
#  sum1 = 0
#  sum2 = 0
#  $('.table tr').not(':first').not(':last').each ->
#    console.log('aaaa')
#    getnum = (t) ->
#
#      isNumeric = (n) ->
#        !isNaN(parseFloat(n)) and isFinite(n)
#
#      if isNumeric(t)
#        return parseInt(t, 10)
#      0
#
#    sum1 = getnum($(this).find('td:eq(2)').text())
#    sum2 = getnum($(this).find('td:eq(3)').text())
#    console.log(sum1)
#    console.log(sum2)
#    return
#  $('#sum1').text sum1
#  $('#sum2').text sum2
