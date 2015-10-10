class User < ActiveRecord::Base
  has_many :chamados
  has_many :registros
  
  attr_accessor :remember_token
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #VALID_RF_REGEX = /[XFxf]+[0-9]/
  
  before_save { self.email = email.downcase }
  before_save { self.rf = rf.downcase }
  
  validates :name,        presence: true, length: { maximum: 100 }
  validates :email,       presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :rf,          presence: true, length: { maximum:  7  }, uniqueness: { case_sensitive: false }
  validates :celular,     presence: true, length: { maximum: 200 }
  validates :comunicador, presence: true, length: { maximum: 200 }
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  
  def self.rotina
    User.all.each do |u|
      u.update_column(:precisa_deslogar, true) if u.logado
    end
    puts "oi"
  end
  
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  def forget
    update_attribute(:remember_digest, nil)
  end
end