jQuery ->
  
  $('.form-reg').toggle()
  $('.cancelar').toggle()
  $('.justificativa').click ->
    $td = $(this).closest('.td-reg')
    $(this).toggle()
    $td.find('.form-reg').toggle()
    $td.find('.cancelar').toggle()
    $td.find('.reg-text input').val(($(this).html()))
    $td.find('.reg-text input').focus().select()
  
  $('.cancelar').click ->
    $td = $(this).closest('.td-reg')
    $(this).toggle()
    $td.find('.form-reg').toggle()
    $td.find('.justificativa').toggle()
    