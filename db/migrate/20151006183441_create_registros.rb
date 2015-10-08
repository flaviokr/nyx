class CreateRegistros < ActiveRecord::Migration
  def change
    create_table :registros do |t|
      t.references :user, index: true
      t.integer :n_chamados, :default => 0

      t.timestamps null: false
    end
    add_foreign_key :registros, :users
  end
end
