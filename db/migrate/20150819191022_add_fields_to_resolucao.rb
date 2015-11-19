class AddFieldsToResolucao < ActiveRecord::Migration
  def change
  	add_column :resolucoes, :resolvido, :boolean
  	add_column :resolucoes, :contato_externo, :boolean
  	add_column :resolucoes, :empresa_contatada, :string
  	add_column :resolucoes, :nome_atendente_empresa_contatada, :string
  	add_column :resolucoes, :equipamento_trocado, :boolean
  	add_column :resolucoes, :resolucao, :text
  	add_column :resolucoes, :encerramento, :timestamp
  end
end
