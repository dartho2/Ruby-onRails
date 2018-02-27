# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.aa.
# You can use CoffeeScript in this file: http://coffeescript.org/
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


