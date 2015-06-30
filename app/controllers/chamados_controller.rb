class ChamadosController < ApplicationController
  before_action :user_is_admin, only: [:index, :update, :destroy]
  
  def index
    @chamados = Chamado.all
  end
  
  def show
    @chamado = Chamado.find(params[:id])
  end
  
  def new
    @chamado = current_user.chamados.build
  end

  def create
    @chamado = current_user.chamados.build(chamado_params)
    if @chamado.save
      flash[:success] = "Chamado criado com sucesso!"
      redirect_to current_user
    else
      render 'new'
    end
  end
  
  def edit
    @chamado = Chamado.find(params[:id])
  end
  
  def update
    @chamado = Chamado.find(params[:id])
    if @chamado.update_attributes(chamado_params)
      flash[:success] = "Informações do chamado atualizadas!"
      redirect_to chamados_path
    else
      render 'edit'
    end
  end
  
  def destroy
    Chamado.find(params[:id]).destroy
    flash[:success] = "Chamado deletado com sucesso!"
    redirect_to chamados_url
  end
  
  private

    def chamado_params
      params.require(:chamado).permit(:objeto_id, :solicitante_id, 
                                      :canal_contato, :status, :categoria, 
                                      :prioridade, :descricao, 
                                      :observacoes, :status, :resolvido)
    end
       
    def user_is_admin
      if !admin?
        flash[:danger] = "Acesso Negado."
        redirect_to(root_url)
      end
    end
  
end
