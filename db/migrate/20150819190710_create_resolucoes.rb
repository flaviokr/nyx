class CreateResolucoes < ActiveRecord::Migration
  def change
    create_table :resolucoes do |t|

      t.timestamps null: false
    end
  end
end
