class DeleteIndexFromObjetos < ActiveRecord::Migration
  def change
    remove_index :objetos, :nome
  end
end
