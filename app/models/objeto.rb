class Objeto < ActiveRecord::Base
  has_many :chamados
  has_many :objsecship
  has_many :sectors, through: :objsecship
  
  validates :nome, presence: true, length: { maximum:  200  }, uniqueness: { case_sensitive: false }
end
