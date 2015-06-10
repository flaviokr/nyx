class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :rf
      t.string :celular
      t.string :telefone_resid
      t.string :comunicador
      t.string :periodo_de_trab
      t.boolean :admin

      t.timestamps null: false
    end
  end
end
