class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include Shared
  # skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  # skip_before_action :verify_authenticity_token

  before_filter :arrays
  before_filter :checaLogin
  before_filter :carregaUsers
  
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
  
  # def checaSessoes
  #   User.all.each do |u|
  #     if u.precisa_deslogar
  #       u.update_column(:precisa_deslogar, false)
        
  #       # desloga
        
  #       u.update_column(:precisa_deslogar, false)
  #     end
  #   end
  # end
  
  def carregaUsers
    gon.user = current_user if !current_user.nil?
  end
end
