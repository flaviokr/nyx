class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include Shared

  before_filter :arrays
  
  private

  def arrays
  	@chamados_andamento = populaArrays("A")
  	@chamados_concluido = populaArrays("C")
  	@chamados_estourados = populaArrays("E")
  end
  

end
