class Stock < ApplicationRecord
  has_many :transactions
  has_many :shares
  has_many :users, through: :shares

  def data 
    self.chart == [] ? Stock.first.chart : self.chart
  end
end
