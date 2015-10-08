class AddIndexToSectorsNome < ActiveRecord::Migration
  def change
    add_index :sectors, :nome, unique: true
  end
end
