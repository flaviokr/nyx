module ApplicationHelper
      # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Nyx"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def contadorAlerta
    x = 0
    if @chamados_estourados.any?
      @chamados_estourados.each do |e| 
        if current_user.admin?
          x = x + 1 
        elsif e.encarregado_id == current_user.id
          x = x + 1 
        end
      end
    end
    return x
  end

  def contadorNovos
    x = 0
    if @chamados_andamento.any?
      @chamados_andamento.each do |e| 
        if current_user.admin?
          x = x + 1 
        elsif e.encarregado_id == current_user.id
          x = x + 1 
        end
      end
    end
    return x
  end

  def checaSidebar
    # Retorna true se estiver em uma pagina que nao deve ter sidebar
    (params[:controller] == 'sessions' || params[:controller] == 'filtro' || params[:controller] == 'registros') && (params[:action] == 'new' || params[:action] == 'create' || params[:action] == 'filtro' || params[:action] =='index' || params[:action] == 'show' || params[:action] == 'resultado')
  end
  
  def traduz(string)
    case string
      when "January"
        return "Janeiro"
      when "February"
        return "Fevereiro"
      when "March"
        return "Março"
      when "April"
        return "Abril"
      when "May"
        return "Maio"
      when "June"
        return "Junho"
      when "July"
        return "Julho"
      when "August"
        return "Agosto"
      when "September"
        return "Setembro"
      when "October"
        return "Outubro"
      when "November"
        return "Novembro"
      when "December"
        return "Dezembro"
    end
  end
  
end
