class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include Shared
  # skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  # skip_before_action :verify_authenticity_token

  before_filter :redirectLeide
  before_filter :arrays
  before_filter :checaSessoes
  before_filter :carregaUsers
  before_filter :checaLogin
  
  private

  def arrays
  	@chamados_andamento = populaArrays("A")
  	@chamados_concluido = populaArrays("C")
  	@chamados_estourados = populaArrays("E")
  end

  def checaLogin
    if !logged_in? && request.url != "/login"
      redirect_to login_path
    end
  end
  
  def checaSessoes
    if current_registro && (logged_in? && !(mesmo_dia?(Time.now.in_time_zone, current_registro.created_at)))
      current_user.precisa_deslogar = true
    end
  end
  
  def carregaUsers
    if logged_in? && current_user.precisa_deslogar
      log_out if logged_in?
      redirect_to root_url
    end
    # gon.user = current_user if !current_user.nil?
  end
  
  def redirectLeide
    if (current_user && current_user.rf == 'f002746') && !(params[:controller] == 'registros' || params[:controller] == 'sessions')
      redirect_to registros_path
    end
  end
end
