class ChangeStockTransactionTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :stock_transactions, :transactions
  end
end
