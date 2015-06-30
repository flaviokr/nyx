class RemoveResolvidoFromChamado < ActiveRecord::Migration
  def change
    remove_column :chamados, :resolvido, :string
  end
end
