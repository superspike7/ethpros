class Transaction < ApplicationRecord
  validates_presence_of :amount

  belongs_to :stock, optional: true
  belongs_to :user

  after_create :update_user_shares_and_balance

  private

  def update_user_shares_and_balance
    if stock_id
      share = user.shares.find_or_create_by(stock_id:)
      share.value = changed_share_value(share.value)
      user.balance = calculate_balance(share.stock.price)
      user.save!
      share.save!
    else
      update_user_balance
    end
  end

  def update_user_balance
    if transaction_type == 'deposit'
      user.balance += amount 
    elsif transaction_type == 'withdraw'
     user.balance -= amount 
    end
    user.save!
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
      value - amount
    elsif transaction_type == 'buy'
      amount + value
    end
  end
end
