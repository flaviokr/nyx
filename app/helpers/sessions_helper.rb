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
  
  # Da log out no usuario
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end