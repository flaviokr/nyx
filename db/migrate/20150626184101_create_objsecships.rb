class CreateObjsecships < ActiveRecord::Migration
  def change
    create_table :objsecships do |t|
      t.integer :objeto_id
      t.integer :sector_id

      t.timestamps null: false
    end
  end
end
