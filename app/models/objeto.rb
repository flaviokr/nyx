class Objeto < ActiveRecord::Base
  belongs_to :categoria
  
  validates :nome, presence: true, length: { maximum:  200  }  
end
