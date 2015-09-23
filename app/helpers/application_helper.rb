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

end
