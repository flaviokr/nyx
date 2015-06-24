class CreateSectors < ActiveRecord::Migration
  def change
    create_table :sectors do |t|
      t.string :nome
      t.string :bairro
      t.string :rua
      t.string :numero
      t.text :complemento

      t.timestamps null: false
    end
  end
end
