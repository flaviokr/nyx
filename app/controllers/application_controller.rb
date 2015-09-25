class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include Shared

  before_filter :arrays
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

end
