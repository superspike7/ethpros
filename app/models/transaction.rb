class Transaction < ApplicationRecord
  validates_presence_of :amount

  belongs_to :stock, optional: true
  belongs_to :user

  after_create :update_shares

  private

  def update_shares
    if stock_id
      share = user.shares.find_or_create_by(stock_id:)
      user.balance = calculate_balance(share.stock.price)
      user.save!
      share.value = changed_share_value(share.value)
      share.save!
    end
  end

  def calculate_balance(price)
    if transaction_type == 'sell'
      user.balance + amount * price  
    elsif transaction_type == 'buy'
     user.balance - amount * price  
    end
  end

  def changed_share_value(value)
    if transaction_type == 'sell'
      amount - value
    elsif transaction_type == 'buy'
      amount + value
    end
  end
end
