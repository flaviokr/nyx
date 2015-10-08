class ObjetosController < ApplicationController
  before_action :user_is_admin
  
  def index
    @objetos = Objeto.all
  end
  
  def show
    @objeto = Objeto.find(params[:id])
  end
  
  def new
    @objeto = Objeto.new
  end

  def create
    @objeto = Objeto.new(objeto_params)
    if @objeto.save
      flash[:success] = "Objeto criado com sucesso!"
      redirect_to objetos_path
    else
      render 'new'
    end
  end
  
  def edit
    @objeto = Objeto.find(params[:id])
  end
  
  def update
    @objeto = Objeto.find(params[:id])
    if @objeto.update_attributes(objeto_params)
      flash[:success] = "Informações do objeto atualizadas!"
      redirect_to objetos_path
    else
      render 'edit'
    end
  end
  
  def destroy
    Objeto.find(params[:id]).destroy
    flash[:success] = "Setor deletado com sucesso!"
    redirect_to current_user
  end
  
  private

    def objeto_params
      params.require(:objeto).permit(:nome)
    end
       
    def user_is_admin
      redirect_to(current_user) unless admin?
    end
  
end
