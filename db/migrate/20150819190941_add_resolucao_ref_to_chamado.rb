class AddResolucaoRefToChamado < ActiveRecord::Migration
  def change
    add_reference :chamados, :resolucao, index: true
    add_foreign_key :chamados, :resolucoes
  end
end
