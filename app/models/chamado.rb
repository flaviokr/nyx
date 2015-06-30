class Chamado < ActiveRecord::Base
  belongs_to :user
  belongs_to :objeto
  belongs_to :solicitante
  
  validates :user_id,        presence: true
  validates :objeto_id,      presence: true
  validates :solicitante_id, presence: true
  validates :canal_contato,  presence: true, inclusion: { in: %w(E T P), message: "%{value} não está em um formato válido" }
  validates :status,         inclusion: { in: %w(C A E), message: "%{value} não está em um formato válido" }, allow_nil: true
  validates :categoria,      presence: true, inclusion: { in: %w(H S R), message: "%{value} não está em um formato válido" }
  validates :prioridade,     presence: true, length:    { in: 1..10 }, numericality: { only_integer: true }
  validates :descricao,      presence: true
#   validates :created_at
#   validates :updated_at
end