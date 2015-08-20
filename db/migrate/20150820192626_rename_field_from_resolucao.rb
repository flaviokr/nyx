class RenameFieldFromResolucao < ActiveRecord::Migration
  def change
  	rename_column :resolucoes, :resolucao, :justificativa
  end
end
