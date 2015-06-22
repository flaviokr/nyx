module StaticPagesHelper
  
  #Retorna true se o current_user for administrador
  def admin?
    if current_user
      current_user.admin
    end
  end
end
