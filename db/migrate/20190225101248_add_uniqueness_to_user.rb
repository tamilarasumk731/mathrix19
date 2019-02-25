class AddUniquenessToUser < ActiveRecord::Migration[5.2]
  def change
  	add_index :users, :mobile, unique: true
  	add_index :users, :email, unique: true
  	add_index :users, :mathrix_id, unique: true
  end
end