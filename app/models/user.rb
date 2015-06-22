class User < ActiveRecord::Base
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  before_save { self.email = email.downcase }
  before_save { self.rf = email.downcase }
  
  validates :name,              presence: true, length: { maximum: 100 }
  validates :email,             presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :rf,                presence: true, length: { maximum: 7 }, uniqueness: { case_sensitive: false }
  validates :celular,           presence: true
  validates :comunicador,       presence: true
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

end