class CreateObjetos < ActiveRecord::Migration
  def change
    create_table :objetos do |t|
      t.string :nome

      t.timestamps null: false
    end
    add_index :objetos, :nome, unique: true
  end
end
