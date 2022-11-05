# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_10_30_032940) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.float "weight"
    t.decimal "value"
    t.boolean "avaiable"
    t.string "durl"
    t.string "ean"
    t.boolean "offer"
    t.integer "buy_limit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "section"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "native_users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "one_signal_player_id"
    t.string "nickname"
    t.string "image"
    t.string "email", default: "", null: false
    t.boolean "admin"
    t.json "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_native_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_native_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_native_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_native_users_on_uid_and_provider", unique: true
  end

  create_table "ordered_items", force: :cascade do |t|
    t.string "status"
    t.string "final_value"
    t.string "payment_mode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.json "items"
    t.integer "native_user_id"
    t.integer "store_id"
    t.index ["native_user_id"], name: "index_ordered_items_on_native_user_id"
    t.index ["store_id"], name: "index_ordered_items_on_store_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
