class ChangeDetailsToStock < ActiveRecord::Migration[7.0]
  def change
    change_column :stocks, :close_time, :bigint
    change_column :stocks, :delayed_price_time, :bigint
    change_column :stocks, :extended_price_time, :bigint
    change_column :stocks, :open_time, :bigint
  end
end
