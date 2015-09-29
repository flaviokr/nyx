$(document).change(function() {
	var array_abertura = $('#filtro td.abertura');
	var array_encerramento = $('#filtro td.encerramento');
	var media = 0;

	for (i = 0; i < array_abertura.length; i++) {
    	media = (media + moment(array_encerramento[i].innerHTML).unix() - moment(array_abertura[i].innerHTML).unix());
	}

	media = media/array_abertura.length;

	media_horas = media/3600;
	media_min = parseInt((media%3600)*60/3600);

	$('#tempo_medio').html(parseInt(media_horas) + "&nbsp;horas&nbspe&nbsp;" + media_min + "&nbsp;minutos");
	$('#n_chamados').html(array_abertura.length);
});