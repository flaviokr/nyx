module SessionsHelper

  # Loga o usuario (user)
  def log_in(user)
    session[:user_id] = user.id
  end

  # Retorna o usuario logado atualmente (se existir um)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) # guarda o resultado em @current_user pra nao ter que 
                                                          # consultar o banco de dados toda vez que quiser achar o usuario atual
  end

  # Retorna true se o usuario estiver logado
  def logged_in?
    !current_user.nil?
  end  
  
  #Retorna true se o current_user for administrador
  def admin?
    if current_user
      current_user.admin
    end
  end
  
  # Da log out no usuario
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  # Retorna true se o user for o usuario atual
  def current_user?(user)
    user == current_user
  end
end