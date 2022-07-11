class Transaction < ApplicationRecord
  belongs_to :stock
  belongs_to :user
  
  after_create :update_shares

  private

  def update_shares
    if self.stock_id
      share = self.user.shares.find_or_create_by(stock_id: self.stock_id)
      share.value = changed_share_value(share.value)
      share.save!
    end
  end

  def changed_share_value(value)
    if self.transaction_type == 'SELL'
      value - self.amount 
    elsif self.transaction_type == 'BUY'
      value + self.amount 
    end
  end
end
