require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe "add shares callback" do
    it 'creates a share after transaction is created' do
      transaction = create(:transaction, amount: 10)

      expect(transaction.user.shares.last).to be_present
      expect(transaction.user.shares.last.value).to be(10)
    end
  end
end
