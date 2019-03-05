class RemoveIndexFromUser < ActiveRecord::Migration[5.2]
  def change
  	  	remove_index :users, :mobile
  end
end
