class AddEstouradoToChamado < ActiveRecord::Migration
  def change
    add_column :chamados, :estourado, :boolean, :default => false
  end
end
