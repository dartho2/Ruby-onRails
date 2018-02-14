# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery(document).ready ($) ->
  $('body').on 'click', '.remove_fields', ->
    console.log('pppp')
    $(this).parents('#js-item-product').remove()
    if $('.delete').length < 2
      $('.delete').hide()
    return

  $('#radioBtn a').on 'click', ->
    sel = $(this).data('title')
    tog = $(this).data('toggle')
    $('#' + tog).prop 'value', sel
    $('a[data-toggle="' + tog + '"]').not('[data-title="' + sel + '"]').removeClass('active').addClass 'notActive'
    $('a[data-toggle="' + tog + '"][data-title="' + sel + '"]').removeClass('notActive').addClass 'active'
    return


