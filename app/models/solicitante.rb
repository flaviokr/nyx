class Solicitante < ActiveRecord::Base
  belongs_to :sector
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :rf,          presence: true, length: { maximum:  7  }, uniqueness: { case_sensitive: false }
  validates :nome,        presence: true, length: { maximum: 100 }
  validates :email,       presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :ramal,       presence: true, length: { maximum: 200 }
end
