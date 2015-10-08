class RemoveCategoriaFromObjetos < ActiveRecord::Migration
  def change
  	remove_column :objetos, :categoria, :string
  end
end
