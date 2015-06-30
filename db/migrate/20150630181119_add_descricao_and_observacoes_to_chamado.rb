class AddDescricaoAndObservacoesToChamado < ActiveRecord::Migration
  def change
    add_column :chamados, :descricao, :text
    add_column :chamados, :observacoes, :text
  end
end
