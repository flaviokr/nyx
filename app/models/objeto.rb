class Objeto < ActiveRecord::Base
  
  validates :nome, presence: true, length: { maximum:  200  }, uniqueness: { case_sensitive: false }
end
