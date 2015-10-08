class RemoveTelefoneResidFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :telefone_resid, :string
  end
end
