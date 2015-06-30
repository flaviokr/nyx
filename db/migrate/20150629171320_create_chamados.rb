class CreateChamados < ActiveRecord::Migration
  def change
    create_table :chamados do |t|
      t.string :canal_contato
      t.string :status
      t.string :resolvido
      t.integer :prioridade
      t.string :categoria
      t.string :descricao
      t.string :observacoes
      t.references :user, index: true
      t.references :objeto, index: true
      t.references :solicitante, index: true

      t.timestamps null: false
    end
    add_foreign_key :chamados, :users
    add_foreign_key :chamados, :objetos
    add_foreign_key :chamados, :solicitantes
  end
end
