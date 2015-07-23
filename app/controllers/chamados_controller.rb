class ChamadosController < ApplicationController
  before_action :user_is_admin, only: [:index, :destroy]
  
  def index
    @chamados = Chamado.all
    @chamados_espera = Array.new
    @chamados_andamento = Array.new
    @chamados_concluido = Array.new
    @chamados.each do |chamado|
      if chamado.status == "E"
        @chamados_espera << chamado
      elsif chamado.status == "A"
        @chamados_andamento << chamado
      elsif chamado.status == "C"
        @chamados_concluido << chamado
      end
    end
    @chamados_espera.sort! { |a,b| b.prioridade <=> a.prioridade}   
    @chamados_andamento.sort! { |a,b| b.prioridade <=> a.prioridade} 
    @chamados_concluido.sort! { |a,b| b.prioridade <=> a.prioridade} 
  end
  
  def show
    @chamado = Chamado.find(params[:id])
  end
  
  def new
    @chamado = current_user.chamados.build
    @solicitante = Solicitante.new
  end

  def create    
    @solicitante = Solicitante.new(params.require(:solicitante).permit(:sector_id, :rf, :nome, :email, :ramal))
    @solicitante_conferir = Solicitante.where("rf = :rf", { rf: @solicitante.rf }).take
    
    if @solicitante_conferir && @solicitante.rf == @solicitante_conferir.rf
      @solicitante.id = @solicitante_conferir.id
    elsif
      @solicitante.save
    end
    
    @chamado = current_user.chamados.build(chamado_params)       
    if @chamado.save
      @chamado.update_attribute(:solicitante_id, @solicitante.id)
      # session[:chamado_id] = @chamado.id.to_s
      redirect_to current_user
    else
      render 'new'
    end
  end
  
  def edit
    @chamado = Chamado.find(params[:id])
  end
  
  def update
    if !params[:chamado]
      @chamado = Chamado.find(params[:id])
      @chamado.update_attributes(status: params[:status])
      @chamusership = Chamusership.new(user_id: current_user.id.to_s, chamado_id: @chamado.id.to_s)
      @chamusership.save
      redirect_to current_user
    else
      @chamado = Chamado.find(params[:id])
      params[:chamado][:status] = 'C' if !params[:chamado][:descricao]
      if @chamado.update_attributes(chamado_params)
        # flash[:success] = "Chamado atualizado!"
        redirect_to current_user
      else
        render 'edit'
      end
    end
  end
  
  def destroy
    Chamado.find(params[:id]).destroy
    flash[:success] = "Chamado deletado com sucesso!"
    redirect_to current_user
  end
  
  private

    def chamado_params
      params.require(:chamado).permit(:objeto_id, 
                                      :canal_contato, :status, :categoria, 
                                      :prioridade, :descricao, 
                                      :observacoes, :status, :resolvido, :resolucao)
    end
       
    def user_is_admin
      if !admin? && params[:chamado] && params[:chamado].length != 3
        redirect_to(current_user)
      end
    end
  
end
