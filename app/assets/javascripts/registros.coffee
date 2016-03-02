jQuery ->
  
  $('.form-reg').toggle()
  $('.cancelar').toggle()
  $('#corpo').delegate 'tr td.td-reg', 'click', ->
    $td = $(this)
    $td.find('.justificativa').toggle()
    $td.find('.form-reg').toggle()
    $td.find('.cancelar').toggle()
    $td.find('.reg-text input').val(($(this).find('.justificativa').html()))
    $td.find('.reg-text input').focus().select()
    $td.removeClass('td-reg')
  
  $('#corpo').delegate 'tr td div.cancelar', 'click', ->
    $td = $(this).closest('td')
    $(this).toggle()
    $td.find('.form-reg').toggle()
    $td.find('.justificativa').toggle()
    $td.addClass('td-reg')
    