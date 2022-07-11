class AddChartToStock < ActiveRecord::Migration[7.0]
  def change
    add_column :stocks, :chart, :json
    add_column :stocks, :logo_url, :string
    add_column :stocks, :change_percent, :string
    change_column :stocks, :price, :float
  end
end
