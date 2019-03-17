class CreateUserevents < ActiveRecord::Migration[5.2]
  def change
    create_table :userevents do |t|
      t.references :user, null: false
      t.references :event, null: false

      t.timestamps
    end
  end
end
