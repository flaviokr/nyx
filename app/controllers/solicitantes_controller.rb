class SolicitantesController < ApplicationController
  before_action :user_is_admin
  
  def index
    @solicitantes = Solicitante.all.order(nome: :asc)
  end
  
  def show
    @solicitante = Solicitante.find(params[:id])
    @chamados = @solicitante.chamados
  end
  
  def new
    @solicitante = Solicitante.new
  end

  def create
    @solicitante = Solicitante.new(solicitante_params)
    if @solicitante.save
      flash[:success] = "Solicitante criado com sucesso!"
      redirect_to solicitantes_path
    else
      render 'new'
    end
  end
  
  def edit
    @solicitante = Solicitante.find(params[:id])
  end
  
  def update
    @solicitante = Solicitante.find(params[:id])
    if @solicitante.update_attributes(solicitante_params)
      flash[:success] = "Informações do solicitante atualizadas!"
      redirect_to solicitantes_path
    else
      render 'edit'
    end
  end
  
  def destroy
    Solicitante.find(params[:id]).destroy
    flash[:success] = "Solicitante deletado com sucesso!"
    redirect_to solicitantes_path
  end
  
  private

    def solicitante_params
      params.require(:solicitante).permit(:sector_id, :rf, :nome, :email, :ramal)
    end
       
    def user_is_admin
      if !admin?
        redirect_to(current_user)
      end
    end
end
