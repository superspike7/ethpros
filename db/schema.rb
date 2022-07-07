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

ActiveRecord::Schema[7.0].define(version: 2022_07_06_093832) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stock_transactions", force: :cascade do |t|
    t.bigint "stock_id", null: false
    t.bigint "user_id", null: false
    t.integer "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stock_id"], name: "index_stock_transactions_on_stock_id"
    t.index ["user_id"], name: "index_stock_transactions_on_user_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.integer "avg_total_volume"
    t.string "calculation_price"
    t.float "change_percent"
    t.string "change_percent_s"
    t.integer "close_time"
    t.string "company_name"
    t.float "delayed_price"
    t.integer "delayed_price_time"
    t.float "extended_change_percent"
    t.string "extended_change_percent_s"
    t.integer "extended_price"
    t.integer "extended_price_time"
    t.integer "iex_ask_price"
    t.integer "iex_ask_size"
    t.integer "iex_bid_price"
    t.integer "iex_bid_size"
    t.bigint "iex_last_updated"
    t.datetime "iex_last_updated_t"
    t.float "iex_market_percent"
    t.float "iex_realtime_price"
    t.integer "iex_realtime_size"
    t.integer "iex_volume"
    t.float "latest_price"
    t.string "latest_source"
    t.string "latest_time"
    t.bigint "latest_update"
    t.datetime "latest_update_t"
    t.integer "latest_volume"
    t.bigint "market_cap"
    t.integer "open_time"
    t.float "pe_ratio"
    t.float "previous_close"
    t.string "primary_exchange"
    t.float "week_52_high"
    t.float "week_52_low"
    t.float "ytd_change"
    t.float "change"
    t.float "close"
    t.float "high"
    t.float "low"
    t.float "open"
    t.string "symbol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "stock_transactions", "stocks"
  add_foreign_key "stock_transactions", "users"
end
