class SolicitantesController < ApplicationController
  before_action :user_is_admin
  
  def index
    @solicitantes = Solicitante.all
    @chamados_estourados = array_estourados
  end
  
  def show
    @solicitante = Solicitante.find(params[:id])
    @chamados = @solicitante.chamados
    @chamados_estourados = array_estourados
  end
  
  def new
    @solicitante = Solicitante.new
    @chamados_estourados = array_estourados
  end

  def create
    @solicitante = Solicitante.new(solicitante_params)
    if @solicitante.save
      flash[:success] = "Solicitante criado com sucesso!"
      redirect_to solicitantes_path
    else
      render 'new'
    end
  end
  
  def edit
    @chamados_estourados = array_estourados
    @solicitante = Solicitante.find(params[:id])
  end
  
  def update
    @solicitante = Solicitante.find(params[:id])
    if @solicitante.update_attributes(solicitante_params)
      flash[:success] = "Informações do solicitante atualizadas!"
      redirect_to solicitantes_path
    else
      render 'edit'
    end
  end
  
  def destroy
    Solicitante.find(params[:id]).destroy
    flash[:success] = "Solicitante deletado com sucesso!"
    redirect_to current_user
  end
  
  private

    def solicitante_params
      params.require(:solicitante).permit(:sector_id, :rf, :nome, :email, :ramal)
    end
       
    def user_is_admin
      if !admin?
        redirect_to(current_user)
      end
    end
    def verificaAtencao(tempo_abertura, prioridade)
      t = 0      
      case prioridade
      when "1"
       t = 360
      when "2"
        t = 300
      when "3"
        t = 240
      when "4"
        t = 180
      end
      if Time.now.to_i - tempo_abertura > t
        return true
      else
        return false
      end
    end
    def array_estourados
      @chamados = Chamado.all
      @chamados_estourados = Array.new
      @chamados.each do |chamado|
        if chamado.status == "A" && verificaAtencao(chamado.abertura.to_i, chamado.prioridade)
          @chamados_estourados << chamado
        elsif chamado.status == "A" && !(verificaAtencao(chamado.abertura.to_i, chamado.prioridade))
          @chamados_andamento << chamado
        elsif chamado.status == "C"
          @chamados_concluido << chamado
        end
      end
      @chamados_estourados.sort! { |a,b| b.prioridade <=> a.prioridade}
      return @chamados_estourados
    end
end
