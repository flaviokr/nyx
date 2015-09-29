# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  # Hide menu once we know its width
  $setinha = $('#showmenu') 
  $setinha.click ->
    $menu = $('.menu')
    if $menu.is(':visible')
      $setinha.removeClass('glyphicon-chevron-up')
      $setinha.addClass('glyphicon-chevron-down')
      # Slide away
      $menu.animate { left: -($menu.outerWidth() + 10)}, 200, ->
        $menu.slideUp(200)
      return
    else
      $setinha.removeClass('glyphicon-chevron-down')
      $setinha.addClass('glyphicon-chevron-up')
      # Slide in
      $menu.slideDown(200).css('left', -($menu.outerWidth() + 10)).animate {left: 0}, 200 
    return
  return
  