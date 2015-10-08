class Objeto < ActiveRecord::Base
  belongs_to :categoria
  
  validates :nome,      presence: true, length: { maximum:  200  }, uniqueness: { case_sensitive: false }  
end
