class ChamadosController < ApplicationController
  before_action :user_is_admin, only: [:index, :destroy, :filtro]
  
  def index    
  end
  
  def show
    @chamado = Chamado.find(params[:id])
  end
  
  def new
    gon.solicitantes = Solicitante.all
    @chamado = current_user.chamados.build
    @solicitante = Solicitante.new
    @objetos = Objeto.all
  end

  def create
    gon.solicitantes = Solicitante.all
    @solicitante = Solicitante.new(params.require(:solicitante).permit(:sector_id, :rf, :nome, :email, :ramal))
    @solicitante_conferir = Solicitante.where("rf = :rf", { rf: @solicitante.rf }).take
    @chamado = current_user.chamados.build(chamado_params)
    if @solicitante_conferir && @solicitante_conferir.rf == @solicitante.rf
      if @chamado.save
        @chamado.update_attribute(:solicitante_id, @solicitante_conferir.id)
        if !params[:chamado][:categoria_id].blank?
          @categoria = Categoria.find(params[:chamado][:categoria_id])
          @chamado.update_attribute(:categoria_id, @categoria.id)
        end
        redirect_to current_user
        return
      else
        render 'new'
        return
      end
    elsif @solicitante.save
    @aux = Solicitante.where("rf = :rf", { rf: @solicitante.rf }).take
      if @chamado.save
        @chamado.update_attribute(:solicitante_id, @aux.id)
        if !params[:chamado][:categoria_id].blank?
          @categoria = Categoria.find(params[:chamado][:categoria_id])
          @chamado.update_attribute(:categoria_id, @categoria.id)
        end
        redirect_to current_user
        return
      else
        render 'new'
        return
      end
    else
      render 'new'
    end
  end
  
  def edit
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

        @resolucao = Resolucao.new(params.require(:resolucao).permit(:resolvido, :encerramento, :contato_externo, :empresa_contatada, :nome_atendente_empresa_contatada, :equipamento_trocado, :justificativa))

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
        registra_chamado if params[:pagina_edit] == "1"
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
                                      :observacoes, :status, :resolucao_id, :encarregado_id, :abertura)
    end
       
    def user_is_admin
      if !admin? && params[:chamado] && params[:chamado].length != 3
        redirect_to(current_user)
      end
    end
end
