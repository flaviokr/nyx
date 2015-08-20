class Resolucao < ActiveRecord::Base
	self.table_name = 'resolucoes'
	belongs_to :chamado

	validates :resolvido, presence: true
end
