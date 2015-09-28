class FiltroController < ApplicationController
  skip_before_filter :arrays
  def filtro       
    @chamados = Chamado.all
  end
  
end
