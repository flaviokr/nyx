$(function() {
	$('#n_chamados').html($('#filtro td.abertura').length);
	calcular();
	$('#daterange').daterangepicker();
});

$(document).change(function() {
	calcular();
});

// function calcular_intervalo() {
// 	var range = $('#daterange');
// 	var tabela = $('#filtro');
// 	var linhas = $('#filtro tbody tr');
// 	var data_inicio;
// 	var data_fim;
// 	var resultado;
// 	var contador = 0;
	
// 	$('#daterange').on('apply.daterangepicker', function(ev, picker) {
//     	data_inicio = picker.startDate;
//     	data_fim = picker.endDate;
//     	linhas.each(function() {
//     		var string_data = $(this).find('td.abertura').text().substring(0, 10);
//     		var moment_data = moment(string_data);
// 			if ((moment_data <= data_fim && moment_data >= data_inicio)){  //se nao esta dentro
// 				$(this).show();
// 				contador++;
// 			} else {
// 				$(this).hide();
// 			}
//     	})
//     	$('#resultado').html(contador);
// });
// 	// alert(linhas.length)
// }

function calcular() {
	var array_abertura = $('#filtro td.abertura');
	var array_encerramento = $('#filtro td.encerramento');
	var array_estourados = $('#filtro td.estourado');
	var media = 0;
	var contador = 0;
	var cont_est = 0;
	var enc = 0;
	var abr = 0;
	

	for (var i = 0; i < array_abertura.length; i++) {
		enc = moment(array_encerramento[i].innerHTML).unix();
		if (isNaN(enc)) {
			contador++;
		} else {
			abr = moment(array_abertura[i].innerHTML).unix()
	    	media = media + enc - abr;
	    	if(array_estourados[i].innerHTML == "Sim") cont_est++;
		}
	}


	
	media = media/(array_abertura.length - contador);
	if (isNaN(media)) media = 0;	

	media_horas = media/3600;
	media_min = parseInt((media%3600)*60/3600);

	$('#tempo_medio').html(parseInt(media_horas) + "&nbsp;horas&nbspe&nbsp;" + media_min + "&nbsp;minutos");
	$('#n_chamados').html(array_abertura.length);
	$('#n_estourados').html(cont_est);
}