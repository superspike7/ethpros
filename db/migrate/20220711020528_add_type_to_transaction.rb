class AddTypeToTransaction < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :transaction_type, :string, null: false
    change_column_null :transactions, :stock_id, true
  end
end
