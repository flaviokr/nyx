class Solicitante < ActiveRecord::Base
  has_many   :chamados
  belongs_to :sector
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  before_save { self.email = email.downcase }
  before_save { self.rf = rf.downcase }
  
  validates :rf,        presence: true, length: { maximum:  7  }, uniqueness: { case_sensitive: false }
  validates :nome,      presence: true, length: { maximum: 100 }
  validates :email,     presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :ramal,     presence: true, length: { maximum: 200 }
  validates :sector_id, presence: true
end
