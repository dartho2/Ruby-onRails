# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.aa.
# You can use CoffeeScript in this file: http://coffeescript.org/

get_id_prefix = (input_field) ->
  id_prefix = input_field.attr('id')
  id_prefix = id_prefix.substring(0, id_prefix.lastIndexOf('_'))
  id_prefix


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



init_invoice_item_autocomplete_magazine = (input_field) ->
  id_prefix = get_id_prefix input_field
  input_field.autocomplete source: '/panel/magazines/autocomplete.json', select: (event, ui) ->
    $("##{id_prefix}_id").val ui.item.id
    $("##{id_prefix}_id").trigger "change" # to trigger recalculations
#    $("##{id_prefix}_price").val ui.item.price
#    $("##{id_prefix}_price").trigger "change" # to trigger recalculations
#    $("##{id_prefix}_quantity").val('1').html update_price
#    $("##{id_prefix}_quantity").trigger "change"


