class RemoveResolvido2FromChamado < ActiveRecord::Migration
  def change
  	remove_column :chamados, :resolvido, :boolean
  end
end
