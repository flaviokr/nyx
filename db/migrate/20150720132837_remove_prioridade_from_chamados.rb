class RemovePrioridadeFromChamados < ActiveRecord::Migration
  def change
    remove_column :chamados, :prioridade, :integer
  end
end
