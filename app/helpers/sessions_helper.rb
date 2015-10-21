module SessionsHelper
  
  # Loga o usuario (user)
  def log_in(user)
    session[:user_id] = user.id
    user.update_column(:logado, true)
  end

  # Retorna o usuario logado atualmente (se existir um)
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end
  
  def current_registro
    @registro = Registro.where(user_id: current_user.id).last if current_user
  end
  
  def mesmo_dia?(data_1, data_2)
    Time.at(data_1).to_date === Time.at(data_2).to_date
  end
  
  def abre_registro
    if current_registro
      mesmo_dia?(current_registro.created_at, Time.now.in_time_zone) ? 
      current_registro.update_column(:updated_at, current_registro.created_at) : 
      @registro = Registro.create(user_id: current_user.id)
    else
      @registro = Registro.create(user_id: current_user.id)
    end
  end
  
  def fecha_registro
    current_registro.touch if current_registro
  end
  
  def registra_chamado
    current_registro.update_column(:n_chamados, current_registro.n_chamados + 1)
  end
  
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
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
    current_user.update_column(:precisa_deslogar, false)
    current_user.update_column(:logado, false)
    
    if current_registro && (mesmo_dia?(Time.now.in_time_zone, current_registro.created_at))
      fecha_registro
    else
      current_registro.update_column(:updated_at, Time.at(0)) if current_registro
    end
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
  
  # Retorna true se o user for o usuario atual
  def current_user?(user)
    user == current_user
  end
end