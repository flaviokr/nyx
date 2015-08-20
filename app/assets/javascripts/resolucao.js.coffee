# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
$(document).on 'ready page:load', ->
	$("#form_contato_externo").hide()
	form = $('#form_contato_externo').html()	
	$('#resolucao_contato_externo').change ->
		selecionado = $('#resolucao_contato_externo :selected').text()
		if selecionado == "Sim"
			$("#form_contato_externo").show()
			$('#form_contato_externo').html(form)
		else
			$('#form_contato_externo').empty			
			$('#form_contato_externo').hide()