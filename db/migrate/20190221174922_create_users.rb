class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.references :college, null: false
      t.string :name, null: false
      t.string :roll_no, null: false
      t.string :email, null: false
      t.string :mobile, null: false
      t.string :course, null: false
      t.string :mathrix_id, null: false
      t.integer :year, null: false
      t.boolean :gender, null: false
      t.timestamps
    end
  end
end


