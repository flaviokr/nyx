module Shared
  extend self
  def populaArrays(status)    
    verificaEstourados
    @chamados = Chamado.where(status: status)
    @chamados_retorno = Array.new
    @chamados.each do |chamado|        
      @chamados_retorno << chamado      
    end
    @chamados_retorno.sort! { |a,b| b.prioridade <=> a.prioridade}
    return @chamados_retorno
  end

  def verificaEstourados
    @chamados = Chamado.where(status: "A")    
    @chamados.each do |chamado|
      if verificaAtencao(chamado.abertura.to_i, chamado.prioridade)
        chamado.update_attributes(status: "E")
      end
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
end