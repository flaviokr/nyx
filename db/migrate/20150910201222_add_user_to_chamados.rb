class AddUserToChamados < ActiveRecord::Migration
  def change
    add_reference :chamados, :encarregado, index: true, foreign_key: true    
  end
end
