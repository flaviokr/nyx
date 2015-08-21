class Resolucao < ActiveRecord::Base
	self.table_name = 'resolucoes'
	belongs_to :chamado

	validates :resolvido, presence: true
	validates :contato_externo, presence: true
	# validates :empresa_contatada, presence: true
	# validates :nome_atendente_empresa_contatada, presence: true, allow_nil: true
	validates :equipamento_trocado, presence: true
	validates :justificativa, presence: true
end
