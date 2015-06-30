class AddResolvidoToChamado < ActiveRecord::Migration
  def change
    add_column :chamados, :resolvido, :boolean
  end
end
