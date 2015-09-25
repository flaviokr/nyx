class FiltroController < ApplicationController

  def filtro       
    @chamados = Chamado.all
  end
  
end
