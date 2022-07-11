class AddDefaultvalueToShares < ActiveRecord::Migration[7.0]
  def change
    change_column_default :shares, :value, from: nil, to: 0 
  end
end
