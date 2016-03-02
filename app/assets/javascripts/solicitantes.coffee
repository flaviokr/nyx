# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#pesquisa-solic').focus()
  $('#pesquisa-solic').keyup ->
    val = $(this).val().toLowerCase()
    $('.item-solic').hide()
    $('.item-solic').each ->
      text = $(this).find('.nome-solic').text().toLowerCase()
      if text.indexOf(val) isnt -1
        $(this).show()