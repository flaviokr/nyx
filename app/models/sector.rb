class Sector < ActiveRecord::Base
  has_many :solicitantes
  
  validates :nome,   presence: true, uniqueness: { case_sensitive: false }
end
