class SectorsController < ApplicationController
  before_action :user_is_admin, only: [:index, :new, :create, :edit, :update, :destroy]
  
  def index
    @sectors = Sector.all
  end
  
  def show
    @sector = Sector.find(params[:id])
  end
  
  def new
    @sector = Sector.new
  end

  def create
    @sector = Sector.new(sector_params)
    if @sector.save
      flash[:success] = "Setor criado com sucesso!"
      redirect_to sectors_path
    else
      render 'new'
    end
  end
  
  def edit
    @sector = Sector.find(params[:id])
  end
  
  def update
    @sector = Sector.find(params[:id])
    if @sector.update_attributes(sector_params)
      flash[:success] = "Informações do setor atualizadas!"
      redirect_to sectors_path
    else
      render 'edit'
    end
  end
  
  def destroy
    Sector.find(params[:id]).destroy
    flash[:success] = "Setor deletado com sucesso!"
    redirect_to current_user
  end
  
  private

    def sector_params
      params.require(:sector).permit(:nome, :bairro, :rua, :numero, :complemento)
    end
       
    def user_is_admin
      redirect_to(current_user) unless admin?
    end
  
end
