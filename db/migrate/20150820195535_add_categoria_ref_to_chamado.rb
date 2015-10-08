class AddCategoriaRefToChamado < ActiveRecord::Migration
  def change
    add_reference :chamados, :categoria, index: true
    add_foreign_key :chamados, :categorias
  end
end
