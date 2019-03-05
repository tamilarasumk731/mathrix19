class AddMacToWorkshop < ActiveRecord::Migration[5.2]
  def up
  	add_column :workshops, :mac, :string, unique: true
  end

  def down
  	remove_column :workshops, :mac
  end
end
