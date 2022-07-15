require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe "after create callback" do
    context 'Trader Buys a Stock' do
      it 'adds an existing share and updates user balance after transaction is created' do
        user = create(:user, balance: 100)
        stock = create(:stock, price: 12)
        user.transactions.create(stock_id: stock.id, amount: 2, transaction_type: 'buy')
        
        expect(user.shares.last).to be_present
        expect(user.shares.last.value).to eq(2)
        expect(user.balance).to eq(76)
      end
    end
    
    context 'Trader Sells a Stock' do
      it 'subtracts an existing share and updates user balancke after transaction is created' do
        user = create(:user, email: "spike@gmail.com", balance: 165)
        stock = create(:stock, price: 12)
        user.transactions.create(stock_id: stock.id, amount: 10, transaction_type: 'buy')
        transaction = user.transactions.create(stock_id: stock.id, amount: 5, transaction_type: 'sell')

        expect(user.shares.first.value).to eq(5)
        expect(user.balance).to eq(105)
      end
    end
    
    context 'Trader Deposits Cash' do
      it 'adds the users current balance' do
        user = create(:user, email: "spike@gmail.com", balance: 45)
        user.transactions.create(amount: 5, transaction_type: 'deposit')

        expect(user.balance).to eq(50)
      end
    end
    
    context 'Trader Withdraws Cash' do
      it 'adds the users current balance' do
        user = create(:user, email: "spike@gmail.com", balance: 45)
        user.transactions.create(amount: 40, transaction_type: 'withdraw')

        expect(user.balance).to eq(5)
      end
    end
  end
end
