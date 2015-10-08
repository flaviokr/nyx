#class UserNotifier < ApplicationMailer
class UserNotifier < ActionMailer::Base
  default :from => 'sistemanyx@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  # def send_signup_email(user)
  #   @user = user
  #   mail( :to => @user.email,
  #   :subject => 'Chupa! Consegui' )
  # end
  
  def send_signup_email(chamado)
    # @user = user
    @chamado = chamado
    mail( :to => 'eltonsilva@prefeitura.sp.gov.br',
    :subject => "[Suporte Informática] Chamado #{@chamado.id} em estado de Alerta!" )
  end
end
