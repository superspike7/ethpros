class ChangeStocksTable < ActiveRecord::Migration[7.0]
  def up
    change_table :stocks do |t|
      t.remove :avg_total_volume,
               :calculation_price,
               :change_percent,
               :change_percent_s,
               :close_time,
               :delayed_price,
               :delayed_price_time,
               :extended_change_percent,
               :extended_change_percent_s,
               :extended_price,
               :extended_price_time,
               :iex_ask_price,
               :iex_ask_size,
               :iex_bid_price,
               :iex_bid_size,
               :iex_last_updated,
               :iex_last_updated_t,
               :iex_market_percent,
               :iex_realtime_price,
               :iex_realtime_size,
               :iex_volume,
               :latest_price,
               :latest_time,
               :latest_update,
               :latest_update_t,
               :latest_volume,
               :market_cap,
               :open_time,
               :pe_ratio,
               :primary_exchange,
               :week_52_high,
               :week_52_low,
               :ytd_change,
               :change,
               :close,
               :high,
               :low,
               :open,
               :latest_source,
               :previous_close

      t.integer :price
    end
  end
  
  def down
    change_table :stocks do |t|
      t.integer :avg_total_volume
      t.string :calculation_price
      t.float :change_percent
      t.string :change_percent_s
      t.bigint :close_time
      t.float :delayed_price
      t.bigint :delayed_price_time
      t.float :extended_change_percent
      t.string :extended_change_percent_s
      t.integer :extended_price
      t.bigint :extended_price_time
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
      t.string :latest_time
      t.bigint :latest_update
      t.datetime :latest_update_t
      t.integer :latest_volume
      t.bigint :market_cap
      t.bigint :open_time
      t.float :pe_ratio
      t.string :primary_exchange
      t.float :week_52_high
      t.float :week_52_low
      t.float :ytd_change
      t.float :change
      t.float :close
      t.float :high
      t.float :low
      t.float :open
      t.string :latest_source
      t.float :previous_close

      t.remove :price
    end
  end
end
