class ChangeColumnInWorkshop < ActiveRecord::Migration[5.2]
  def up
  	change_column :workshops, :payment_request_id, :string, null: true
  	change_column :workshops, :long_url, :string, null: true
  	add_column :workshops, :mode, :string, null: false
  end

  def down
	change_column :workshops, :payment_request_id, :string, null: false
  	change_column :workshops, :long_url, :string, null: false
  	remove_column :workshops, :mode
  end
end
