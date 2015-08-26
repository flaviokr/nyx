class Resolucao < ActiveRecord::Base
	self.table_name = 'resolucoes'
	belongs_to :chamado
	validates_inclusion_of :resolvido, :in => [true, false]
	validates_inclusion_of :contato_externo, :in => [true, false]
	validates_inclusion_of :equipamento_trocado, :in => [true, false]
	# validates :empresa_contatada, presence: true
	# validates :nome_atendente_empresa_contatada, presence: true, allow_nil: true
	validates :justificativa, presence: true
end
