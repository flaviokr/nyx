class AddLogadoAndPrecisaDeslogarToUser < ActiveRecord::Migration
  def change
    add_column :users, :logado, :boolean, :default => false
    add_column :users, :precisa_deslogar, :boolean, :default => false
  end
end
