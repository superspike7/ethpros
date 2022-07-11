class Stock < ApplicationRecord
  has_many :transactions
  has_many :shares
  has_many :users, through: :shares
end
