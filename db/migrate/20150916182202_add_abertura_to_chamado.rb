class AddAberturaToChamado < ActiveRecord::Migration
  def change
    add_column :chamados, :abertura, :timestamp
  end
end
