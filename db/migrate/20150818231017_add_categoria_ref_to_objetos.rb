class AddCategoriaRefToObjetos < ActiveRecord::Migration
  def change
    add_reference :objetos, :categoria, index: true
    add_foreign_key :objetos, :categorias
  end
end
