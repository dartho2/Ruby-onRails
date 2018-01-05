# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'click', 'form .remove_fields', (event) ->
  $(this).prev('input[type=hidden]').val('1')
  $(this).closest('div').hide()
  event.preventDefault()

$(document).on 'click', 'form .add_fields', (event) ->
  time = new Date().getTime()
  regexp = new RegExp($(this).data('id'), 'g')
  $(this).before($(this).data('fields').replace(regexp, time))
  event.preventDefault()
$(document).ready ->
  quantitiy = 0
  $('.quantity-right-plus').click (e) ->
# Stop acting like a button
    e.preventDefault()
    # Get the field name
    quantity = parseInt($('#quantity').val())
    # If is not undefined
    $('#quantity').val quantity + 1
    # Increment
    return
  $('.quantity-left-minus').click (e) ->
# Stop acting like a button
    e.preventDefault()
    # Get the field name
    quantity = parseInt($('#quantity').val())
    # If is not undefined
    # Increment
    if quantity > 0
      $('#quantity').val quantity - 1
    return
  return
