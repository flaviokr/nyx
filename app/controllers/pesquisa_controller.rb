class PesquisaController < ApplicationController
  
  def pesquisa
    @chamados = Chamado.where(user_id: current_user.id)
  end
end
