class Transaction < ApplicationRecord
  validates_presence_of :amount

  belongs_to :stock, optional: true
  belongs_to :user

  after_create :update_shares

  private

  def update_shares
    if stock_id
      share = user.shares.find_or_create_by(stock_id:)
      share.value = changed_share_value(share.value)
      share.save!
    end
  end

  def changed_share_value(value)
    if transaction_type == 'sell'
      value - amount
    elsif transaction_type == 'buy'
      value + amount
    end
  end
end
