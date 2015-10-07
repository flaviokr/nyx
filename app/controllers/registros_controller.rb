class RegistrosController < ApplicationController
  
  def index
    @users = Array.new
    User.all.each do |u|
      @users << u if u.rf != "0000000"
    end
    @registros = Registro.all
  end
  
  def resultado
    @user = User.find(params[:user])
    @mes = params[:date][:month]
    @ano = params[:date][:year]
    @string_data = "#{@mes}/#{@ano}"
    @reg = Registro.where(user_id: @user.id)
    @registros = @reg.where("strftime('%m/%Y', created_at) = ?", @string_data)
  end
end
