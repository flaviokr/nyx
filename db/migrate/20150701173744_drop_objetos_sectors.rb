class DropObjetosSectors < ActiveRecord::Migration
  def change
    drop_table :objetos_sectors
  end
end
