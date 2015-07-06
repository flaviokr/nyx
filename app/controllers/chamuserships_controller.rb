class ChamusershipsController < ApplicationController
  before_action :user_is_admin, only: [:destroy]
  
  def new
    if !session[:chamado_id]
      redirect_to current_user
    end
    @chamusership = Chamusership.new
  end
  
  def create
    if params[:chamusership][:user_ids].length == 1
      flash[:danger] = "Selecione pelo menos um técnico"
      redirect_to new_chamusership_path
    else
      cont = 0
      (params[:chamusership][:user_ids].length-1).times do
        @chamusership = Chamusership.new(user_id: params[:chamusership][:user_ids][cont], chamado_id: session[:chamado_id])
        @chamusership.save
        cont = cont + 1
      end
      session[:chamado_id] = nil
      flash[:success] = "Chamado criado com sucesso!"
      redirect_to current_user
    end
  end
  
  def destroy
    Chamusership.find(params[:id]).destroy
    flash[:success] = "Relação Chamado-Técnico deletada com sucesso!"
    redirect_to current_user
  end
  
  private

    def chamusership_params
      params.require(:chamusership).permit(:user_ids => [])
    end
       
    def user_is_admin
      redirect_to(current_user) unless admin?
    end
end
