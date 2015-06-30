class AddStatusAndResolvidoToChamado < ActiveRecord::Migration
  def change
    add_column :chamados, :status, :string, default: 'E'
    add_column :chamados, :resolvido, :boolean, default: false
  end
end
