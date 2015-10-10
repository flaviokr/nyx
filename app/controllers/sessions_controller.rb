class SessionsController < ApplicationController
  skip_before_filter :checaLogin
  skip_before_filter :carregaUsers
  def new
    redirect_to current_user if logged_in?
  end

  def create
    user = User.find_by(rf: params[:session][:rf].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user
      abre_registro
      redirect_to user
    else
      flash.now[:danger] = 'Combinação RF/Senha inválida'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url, status: 303
  end
end