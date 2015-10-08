class Chamado < ActiveRecord::Base
  belongs_to :user
  belongs_to :objeto
  belongs_to :categoria
  belongs_to :solicitante
  has_one :resolucao
  
  
  validates :user_id,        presence: true
  validates :objeto_id,      presence: true, allow_nil: true
  validates :canal_contato,  presence: true, inclusion: { in: %w(E T P), message: "%{value} não está em um formato válido" }
  validates :status,         inclusion: { in: %w(C A E), message: "%{value} não está em um formato válido" }, allow_nil: true
  validates :prioridade,     presence: true, inclusion: { in: %w(1 2 3 4), message: "%{value} não está em um formato válido" }
  validates :descricao,      presence: true
  validates :categoria_id,   presence: true
# validates :solicitante_id
# validates :created_at
# validates :updated_at
end
