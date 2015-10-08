class CreateChamusership < ActiveRecord::Migration
  def change
    create_table :chamuserships do |t|
      t.references :user, index: true
      t.references :chamado, index: true
    end
    add_foreign_key :chamuserships, :users
    add_foreign_key :chamuserships, :chamados
  end
end
