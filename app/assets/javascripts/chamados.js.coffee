# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
$(document).on 'ready page:load', ->
	$("label[for='chamado_objeto_id']").hide()
	$('#chamado_objeto_id').hide()
	objetos = $('#chamado_objeto_id').html()	
	$('#chamado_categoria_id').change ->
		categoria = $('#chamado_categoria_id :selected').text()
		resultado = $(objetos).filter("optgroup[label='#{categoria}']").html()
		if resultado
			$("label[for='chamado_objeto_id']").show()
			$('#chamado_objeto_id').show()
			$('#chamado_objeto_id').html(resultado)
		else
			$('#chamado_objeto_id').empty
			$("label[for='chamado_objeto_id']").hide()
			$('#chamado_objeto_id').hide()
		