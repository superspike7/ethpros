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

ActiveRecord::Schema[7.0].define(version: 2022_07_15_044356) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "shares", force: :cascade do |t|
    t.bigint "stock_id", null: false
    t.bigint "user_id", null: false
    t.integer "value", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stock_id"], name: "index_shares_on_stock_id"
    t.index ["user_id"], name: "index_shares_on_user_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "company_name"
    t.string "symbol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price"
    t.json "chart"
    t.string "logo_url"
    t.string "change_percent"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "stock_id"
    t.bigint "user_id", null: false
    t.integer "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "transaction_type", null: false
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
<<<<<<< HEAD
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer "balance", default: 0
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
=======
    t.integer "role", default: 0
>>>>>>> add role in users
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "shares", "stocks"
  add_foreign_key "shares", "users"
  add_foreign_key "transactions", "stocks"
  add_foreign_key "transactions", "users"
end
