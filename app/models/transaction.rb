class Transaction < ApplicationRecord
  belongs_to :stock
  belongs_to :user
  
  after_create :add_shares

  private

  def add_shares
    if self.stock_id
      share = self.user.shares.find_or_create_by(stock_id: self.stock_id)
      share.value = self.amount + share.value
      share.save!
    end
  end
end
