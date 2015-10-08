class AddStatusAndResolvidoToChamado < ActiveRecord::Migration
  def change
    add_column :chamados, :status, :string, default: 'A'
    add_column :chamados, :resolvido, :boolean, default: false
  end
end
