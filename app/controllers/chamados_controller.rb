class ChamadosController < ApplicationController
  before_action :user_is_admin, only: [:index, :edit, :update, :destroy]
  
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
      session[:chamado_id] = @chamado.id.to_s
      redirect_to new_chamusership_path
    else
      render 'new'
    end
  end
  
  def edit
    if params.length == 3 && !admin?
      redirect_to(current_user)
    end
    @chamado = Chamado.find(params[:id])
  end
  
  def update
    if !params[:chamado]
      @chamado = Chamado.find(params[:id])
      @chamado.update_attributes(status: params[:status])
      redirect_to current_user
    else
      @chamado = Chamado.find(params[:id])
      if @chamado.update_attributes(chamado_params)
        flash[:success] = "Chamado atualizado!"
        redirect_to current_user
      else
        render 'edit'
      end
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
      if !admin? && params[:chamado] && params[:chamado].length != 3
        redirect_to(current_user)
      end
    end
  
end
