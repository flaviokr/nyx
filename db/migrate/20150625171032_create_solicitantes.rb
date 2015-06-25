class CreateSolicitantes < ActiveRecord::Migration
  def change
    create_table :solicitantes do |t|
      t.string :rf
      t.string :nome
      t.string :email
      t.string :ramal
      t.references :sector, index: true

      t.timestamps null: false
    end
    add_foreign_key :solicitantes, :sectors
    add_index :solicitantes, :rf, unique: true
  end
end
