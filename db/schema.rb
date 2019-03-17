# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_03_17_153105) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "colleges", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "userevents", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_userevents_on_event_id"
    t.index ["user_id"], name: "index_userevents_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "roll_no", null: false
    t.string "email", null: false
    t.string "mobile", null: false
    t.string "course", null: false
    t.string "mathrix_id", null: false
    t.integer "year", null: false
    t.boolean "gender", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "college_name", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["mathrix_id"], name: "index_users_on_mathrix_id", unique: true
  end

  create_table "workshops", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "payment_request_id"
    t.decimal "amount", null: false
    t.string "status", null: false
    t.string "long_url"
    t.string "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mac"
    t.string "mode", null: false
    t.index ["order_id"], name: "index_workshops_on_order_id", unique: true
    t.index ["payment_request_id"], name: "index_workshops_on_payment_request_id", unique: true
    t.index ["user_id"], name: "index_workshops_on_user_id"
  end

end
