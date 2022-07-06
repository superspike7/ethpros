class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.integer :avg_total_volume
      t.string :calculation_price
      t.float :change_percent
      t.string :change_percent_s
      t.integer :close_time
      t.string :company_name
      t.float :delayed_price
      t.integer :delayed_price_time
      t.float :extended_change_percent
      t.string :extended_change_percent_s
      t.integer :extended_price
      t.integer :extended_price_time
      t.integer :iex_ask_price
      t.integer :iex_ask_size
      t.integer :iex_bid_price
      t.integer :iex_bid_size
      t.bigint :iex_last_updated
      t.datetime :iex_last_updated_t
      t.float :iex_market_percent
      t.float :iex_realtime_price
      t.integer :iex_realtime_size
      t.integer :iex_volume
      t.float :latest_price
      t.string :latest_source
      t.string :latest_time
      t.bigint :latest_update
      t.datetime :latest_update_t
      t.integer :latest_volume
      t.bigint :market_cap
      t.integer :open_time
      t.float :pe_ratio
      t.float :previous_close
      t.string :primary_exchange
      t.float :week_52_high
      t.float :week_52_low
      t.float :ytd_change
      t.float :change
      t.float :close
      t.float :high
      t.float :low
      t.float :open
      t.string :symbol

      t.timestamps
    end
  end
end
