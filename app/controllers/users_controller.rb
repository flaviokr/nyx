class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :user_is_admin,   only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:show]

  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @chamados = Chamado.all
    @chamados_estourados = Array.new
    @chamados_andamento = Array.new
    @chamados_concluido = Array.new

    @chamados.each do |chamado|
      if chamado.status == "A" && Time.now.to_i - chamado.abertura.to_i > 100
        @chamados_estourados << chamado
      elsif chamado.status == "A" && !(Time.now.to_i - chamado.abertura.to_i > 100)
        @chamados_andamento << chamado
      elsif chamado.status == "C"
        @chamados_concluido << chamado
      end
    end
    @chamados_estourados.sort! { |a,b| b.prioridade <=> a.prioridade}   
    @chamados_andamento.sort! { |a,b| b.prioridade <=> a.prioridade} 
    @chamados_concluido.sort! { |a,b| b.prioridade <=> a.prioridade}   
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Técnico criado com sucesso!"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Informações de técnico atualizadas!"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Tecnico deletado com sucesso!"
    redirect_to current_user
  end

  private

    def user_params
      params.require(:user).permit(:name, :rf, :email, :celular, :password, :comunicador, :admin,  :password_confirmation)
    end
    
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Faça Log in para acessar esta página."
        redirect_to login_url
      end
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(current_user) unless current_user?(@user) || admin?
    end
    
    def user_is_admin
      redirect_to(current_user) unless admin?
    end
end