class Sector < ActiveRecord::Base
  has_many :objsecships
  has_many :objetos, through: :objsecships
  has_many :solicitantes
  
  validates :nome,   presence: true, uniqueness: { case_sensitive: false }
  validates :bairro, presence: true
  validates :rua,    presence: true
  validates :numero, presence: true
end
