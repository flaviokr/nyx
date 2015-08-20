class RemoveCategoriaFromChamado < ActiveRecord::Migration
  def change
    remove_column :chamados, :categoria, :string
  end
end
