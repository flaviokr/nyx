class Chamusership < ActiveRecord::Base
  belongs_to :user
  belongs_to :chamado
    
  validates :user_id, presence: true
  validates :chamado_id, presence: true
  
  def user_ids
  end
end
