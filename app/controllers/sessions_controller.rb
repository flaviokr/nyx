class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(rf: params[:session][:rf].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Combinação RF/Senha inválida'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to current_user
  end
end