class DropChamusership < ActiveRecord::Migration
  def change
    drop_table :chamuserships
  end
end
