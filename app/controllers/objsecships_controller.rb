class ObjsecshipsController < ApplicationController
  before_action :user_is_admin
  
  def index
    @objsecship = Objsecship.all
  end
  
  def new
    @objsecship = Objsecship.new
  end
  
  def create
    @objsecship = Objsecship.new(objsecship_params)
    if @objsecship.save
      flash[:success] = "Relação Objeto-Setor criada com sucesso!"
      redirect_to objsecships_path
    else
      render 'new'
    end
  end
  
  def destroy
    Objsecship.find(params[:id]).destroy
    flash[:success] = "Relação Objeto-Setor deletada com sucesso!"
    redirect_to objsecships_url
  end
  
  private

    def objsecship_params
      params.require(:objsecship).permit(:objeto_id, :sector_id)
    end
       
    def user_is_admin
      redirect_to(current_user) unless admin?
    end
end
