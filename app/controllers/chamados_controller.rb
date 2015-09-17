class ChamadosController < ApplicationController
  before_action :user_is_admin, only: [:index, :destroy]
  
  def index
    @chamados = Chamado.all
    @chamados_andamento = Array.new
    @chamados_concluido = Array.new
    @chamados_estourados = array_estourados
    @chamados_andamento.sort! { |a,b| b.prioridade <=> a.prioridade} 
    @chamados_concluido.sort! { |a,b| b.prioridade <=> a.prioridade}     
  end
  
  def show
    @chamados_estourados = array_estourados
    @chamado = Chamado.find(params[:id])
  end
  
  def new
    @chamados_estourados = array_estourados
    gon.solicitantes = Solicitante.all
    @chamado = current_user.chamados.build
    @solicitante = Solicitante.new
    @objetos = Objeto.all
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
    @chamado.status = "A"
    if !params[:chamado][:categoria_id].blank?
      @categoria = Categoria.find(params[:chamado][:categoria_id])
      @chamado.update_attribute(:categoria_id, @categoria.id)
    end

    if @chamado.save
      @chamado.update_attribute(:solicitante_id, @solicitante.id)
      redirect_to current_user
    else
      render 'new'
    end
  end
  
  def edit
    @chamados_estourados = array_estourados
    @chamado = Chamado.find(params[:id])
    @resolucao = Resolucao.new
  end
  
  def update
    if !params[:chamado]
      @chamado = Chamado.find(params[:id])
      @chamado.update_attributes(status: params[:status])
      redirect_to current_user
    else
      @chamado = Chamado.find(params[:id])
      if params[:resolucao]
        @resolucao = Resolucao.new(params.require(:resolucao).permit(:resolvido, :contato_externo, :empresa_contatada, :nome_atendente_empresa_contatada, :equipamento_trocado, :justificativa))
        if @resolucao.save
          @chamado.update_attribute(:resolucao, @resolucao)
        else
          params[:concluir] ||= "concluir"
          params[:status] ||= "C"
          render 'edit'
          return
        end
      end
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
    redirect_to chamados_path
  end
  
  private

    def chamado_params
      params.require(:chamado).permit(:objeto_id, 
                                      :canal_contato, :status, :categoria_id, 
                                      :prioridade, :descricao, 
                                      :observacoes, :status, :resolucao_id, :solicitante_id, :encarregado_id, :abertura)
    end
       
    def user_is_admin
      if !admin? && params[:chamado] && params[:chamado].length != 3
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
