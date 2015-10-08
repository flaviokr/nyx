class AddCategoriaToObjetos < ActiveRecord::Migration
  def change
    add_column :objetos, :categoria, :string
  end
end
