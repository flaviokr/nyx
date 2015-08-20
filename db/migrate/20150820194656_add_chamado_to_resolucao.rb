class AddChamadoToResolucao < ActiveRecord::Migration
  def change
    add_reference :resolucoes, :chamado, index: true
    add_foreign_key :resolucoes, :chamados
  end
end
