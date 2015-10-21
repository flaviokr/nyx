class RegistrosController < ApplicationController
  
  def index
    @users = Array.new
    User.all.each do |u|
      @users << u if u.rf != "0000000" && u.rf != "f002746"
    end
    @registros = Registro.all
  end
  
  def resultado
    @users = Array.new
    User.all.each do |u|
      @users << u if u.rf != "0000000" && u.rf != "f002746"
    end
    @user = User.find(params[:user])
    @mes = params[:date][:month]
    @ano = params[:date][:year]
    @string_data = "#{@mes}/#{@ano}"
    @reg = Registro.where(user_id: @user.id)
    if !Rails.env.development?
      @registros = @reg.where("extract(year from created_at) = ? and extract(month from created_at) = ?", @ano, @mes).order(created_at: :asc)
    else
      @registros = @reg.where("strftime('%m/%Y', created_at) = ?", @string_data).order(created_at: :asc)
    end
  end  
  
  def updateReg
    @registro = Registro.find(params[:id])
    @registro.update_column(:justificativa, params[:justificativa])
    respond_to do |format|
      format.js
    end
  end
  
end
