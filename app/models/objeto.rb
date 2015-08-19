class Objeto < ActiveRecord::Base
  has_many :chamados
  has_many :objsecships
  has_many :sectors, through: :objsecships
  belongs_to :categoria
  
  validates :nome,      presence: true, length: { maximum:  200  }, uniqueness: { case_sensitive: false }  
end
