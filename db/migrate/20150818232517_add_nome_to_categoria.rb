class AddNomeToCategoria < ActiveRecord::Migration
  def change
    add_column :categorias, :nome, :string
  end
end
