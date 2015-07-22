$(document).on('page:load ready', function(){
	$('#chamado_categoria').click(function(){
		
		if(this.value == 'H'){
			$('#hardware').show();
			$('#software').hide();
			$('#rede').hide();
			$('#blank').hide();
		}else if(this.value == 'S'){
			$('#hardware').hide();
			$('#software').show();
			$('#rede').hide();
			$('#blank').hide();
		}else if(this.value == 'R'){
			$('#hardware').hide();
			$('#software').hide();
			$('#rede').show();
			$('#blank').hide();
		}else if(this.value == ''){
			$('#hardware').hide();
			$('#software').hide();
			$('#rede').hide();
			$('#blank').show();
		}else{
			$('#hardware').hide();
			$('#software').hide();
			$('#rede').hide();
			
		}
	  
	});
});