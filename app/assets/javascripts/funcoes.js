$(document).on('page:load ready', function(){
	$('#chamado_categoria').click(function(){
		
		if(this.value == 'H'){
			$('#hardware').show();
		}
	  
	});
});