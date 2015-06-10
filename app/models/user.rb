class User < ActiveRecord::Base
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  before_save { self.email = email.downcase }
  
  validates :name,              presence: true, length: { maximum: 50 }
  validates :email,             presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :rf,                presence: true, length: { maximu: 7 }, uniqueness: { case_sensitive: false }
  validates :celular,           presence: true
  validates :telefone_resid,    presence: true
  validates :comunicador,       presence: true
  validates :periodo_de_trab,   presence: true
  validates :admin,             presence: true
  
  has_secure_password

end