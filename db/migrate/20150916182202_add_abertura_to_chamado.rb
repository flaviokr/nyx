class AddAberturaToChamado < ActiveRecord::Migration
  def change
    add_column :chamados, :abertura, :timestamp
    add_column :chamados, :encerramento, :timestamp
  end
end
