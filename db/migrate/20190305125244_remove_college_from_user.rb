class RemoveCollegeFromUser < ActiveRecord::Migration[5.2]
    def up
  	remove_reference :users, :college
  	add_column :users, :college_name, :string, null: false
  end
  def down
  	remove_column :users, :college_name
  	add_reference :users, :college
  end
end
