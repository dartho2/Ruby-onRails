# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'click', 'tr .remove_fields', (event) ->
  $(this).prev('input[type="hidden"]').val("1")
  $(this).closest('tr').hide()
  event.preventDefault()

$(document).on 'click', 'form .add_fields', (event) ->
  time = new Date().getTime()
  regexp = new RegExp($(this).data('id'), 'g')
  $(this).before($(this).data('fields').replace(regexp, time))
  event.preventDefault()
  bind1();

$(document).on 'turbolinks:load', ->
  $('input.custom-control-input').click ->
    console.log( "ready!" );
    inputValue = $(this).attr('value')
    $('.' + inputValue).val(1)
    $('.' + inputValue).toggle()
    return
  return

update_price = ->
  console.log 'update'
  row = $(this).parents('.table-list')
  price = row.find('input[data-role="quantity"]').val() * row.find('input[data-role="price"]').val()
  console.log price
  price = price.toFixed(2)
  if isNaN(price) then row.find('.price').html('NaN') else row.find('.price').html(price)
  update_subtotal()
  return

bind1 = ->
  console.log( "ready!" );
  $('input[data-role="quantity"]').blur update_price
  $('input[data-role="price"]').blur update_price
  $('select[data-role="name"]').change update_prices


bind2 = ->
  console.log( "ready!" );
  $('input[data-role="quantity"]').blur update_price
  $('input[data-role="price"]').click update_price

update_prices = ->
  console.log 'update_prices'
  rows = $(this).parents('.table-list')
  price = rows.find('select[data-role="name"]').val()
  console.log price
  if isNaN(price) then $(this).parents('.table-list').find('.price').html('NaN') else $(this).parents('.table-list').find('input[data-role="price"]').html(price)
  return




jQuery ->
  console.log( "auto" );
  $('input[data-role="name"]').autocomplete source: $('input[data-role="name"]').data('autocomplete-source')

# ---
return
# ---


