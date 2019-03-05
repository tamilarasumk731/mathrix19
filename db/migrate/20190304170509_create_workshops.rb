class CreateWorkshops < ActiveRecord::Migration[5.2]
  def change
    create_table :workshops do |t|
      t.references :user, null: false
      t.string :payment_request_id, null: false
      t.decimal :amount, null: false
      t.string :status, null: false
      t.string :long_url, null: false
      t.string :order_id

      t.timestamps
    end
    add_index :workshops, :payment_request_id , unique: true
    add_index :workshops, :order_id, unique: true
  end
end
