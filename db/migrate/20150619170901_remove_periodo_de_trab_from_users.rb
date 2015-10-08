class RemovePeriodoDeTrabFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :periodo_de_trab, :string
  end
end
