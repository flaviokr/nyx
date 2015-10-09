class AddEncerramentoToResolucao < ActiveRecord::Migration
  def change
	  add_column :resolucoes, :encerramento, :timestamp
  end
end

