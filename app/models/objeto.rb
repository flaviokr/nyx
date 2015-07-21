class Objeto < ActiveRecord::Base
  has_many :chamados
  has_many :objsecships
  has_many :sectors, through: :objsecships
  
  validates :nome,      presence: true, length: { maximum:  200  }, uniqueness: { case_sensitive: false }
  validates :categoria, presence: true, inclusion: { in: %w(H S R), message: "%{value} não está em um formato válido" }
end
