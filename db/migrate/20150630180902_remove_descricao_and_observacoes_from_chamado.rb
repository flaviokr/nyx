class RemoveDescricaoAndObservacoesFromChamado < ActiveRecord::Migration
  def change
    remove_column :chamados, :descricao, :string
    remove_column :chamados, :observacoes, :string
  end
end
