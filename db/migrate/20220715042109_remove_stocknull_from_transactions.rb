class RemoveStocknullFromTransactions < ActiveRecord::Migration[7.0]
  def change
    change_column_null :transactions, :stock_id, true
    remove_index :transactions, name: "index_transactions_on_stock_id"
  end
end
