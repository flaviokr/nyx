class RemoveResolucaoFromChamado < ActiveRecord::Migration
  def change
  	remove_column :chamados, :resolucao, :string
  end
end
