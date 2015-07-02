class ChamusershipsController < ApplicationController
  before_action :user_is_admin
  
  def index
    @chamuserships = Chamusership.all
  end
  
  def new
    @chamusership = Chamusership.new
  end
  
  def create
    cont = 0
    (params[:chamusership][:user_ids].length-1).times do
      @chamusership = Chamusership.new(user_id: params[:chamusership][:user_ids][cont], chamado_id: session[:chamado_id])
      @chamusership.save
      cont = cont + 1
    end
    session[:chamado_id] = nil
    flash[:success] = "Chamado criado com sucesso!"
    redirect_to chamuserships_url
  end
  
  def destroy
    Chamusership.find(params[:id]).destroy
    flash[:success] = "Relação Chamado-Técnico deletada com sucesso!"
    redirect_to chamuserships_url
  end
  
  private

    def chamusership_params
      params.require(:chamusership).permit(:user_ids => [])
    end
       
    def user_is_admin
      redirect_to(root_url) unless admin?
    end
end
