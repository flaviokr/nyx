$(document).change(function() {
	var array_abertura = $('#filtro td.abertura');
	var array_encerramento = $('#filtro td.encerramento');
	var media = 0;

	for (i = 0; i < array_abertura.length; i++) {
    	media = (media + moment(array_encerramento[i].innerHTML).unix() - moment(array_abertura[i].innerHTML).unix());
	}

	media = media/array_abertura.length;

	$('#tempo_medio').html(parseInt(media/3600) + "&nbsp;horas&nbspe&nbsp;" + parseInt(media/60) + "&nbsp;minutos");
	$('#n_chamados').html(array_abertura.length);
});