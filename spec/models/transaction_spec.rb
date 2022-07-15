require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe "after create callback" do
    it 'creates a share after transaction is created' do
      transaction = create(:transaction, amount: 10)

      expect(transaction.user.shares.last).to be_present
      expect(transaction.user.shares.last.value).to be(10)
    end
    
    it 'adds an existing share after transaction is created' do
      user = create(:user, email: "spike@gmail.com")
      create(:transaction, user_id: user.id)
      user.transactions.create(stock_id: Stock.first.id, amount: 10, transaction_type: 'buy')

      expect(user.shares.last).to be_present
      expect(user.shares.last.value).to be(79)
    end
    
    it 'subtracts an existing share after transaction is created' do
      user = create(:user, email: "spike@gmail.com")
      create(:transaction, user_id: user.id)
      user.transactions.create(stock_id: Stock.first.id, amount: 10, transaction_type: 'sell')

      expect(user.shares.last).to be_present
      expect(user.shares.last.value).to be(59)
    end
  end
end
