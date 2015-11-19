class AddJustificativaToRegistro < ActiveRecord::Migration
  def change
    add_column :registros, :justificativa, :text
  end
end
