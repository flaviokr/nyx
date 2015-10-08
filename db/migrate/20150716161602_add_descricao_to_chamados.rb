class AddDescricaoToChamados < ActiveRecord::Migration
  def change
    add_column :chamados, :resolucao, :text
  end
end
