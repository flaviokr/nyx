class RemoveStatusAndRsolvidoFromChamado < ActiveRecord::Migration
  def change
    remove_column :chamados, :status, :string
    remove_column :chamados, :resolvido, :boolean
  end
end
