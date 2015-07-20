class AddPrioridadeToChamados < ActiveRecord::Migration
  def change
    add_column :chamados, :prioridade, :string
  end
end
