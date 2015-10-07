module StaticPagesHelper
  
  def chamados_user_mes(user)
    @chamados = Chamado.where(user_id: user.id)
    @chamados_mes = Array.new
    @chamados.each do |c|
      @chamados_mes << c.created_at.strftime("%m/%y")
    end
    @cont = 0
    @chamados_mes.each do |c|
      user.registros.each do |r|
        @cont += 1 if c == r.created_at.strftime("%m/%y")
      end
    end
    @cont
  end
  
  def chamados_dia(user, registro)
    
  end
end
