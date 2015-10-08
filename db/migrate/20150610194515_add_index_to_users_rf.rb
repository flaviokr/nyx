class AddIndexToUsersRf < ActiveRecord::Migration
  
  def change
    add_index :users, :rf, unique: true
  end
end
