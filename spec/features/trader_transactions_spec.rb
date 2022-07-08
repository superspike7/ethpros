require 'rails_helper'

RSpec.feature "TraderTransactionPage", type: :feature do
  scenario 'Trader Bought a stock ' do
    transaction = create(:stock_transaction)
    sign_in transaction.user 

    visit 'stock_transactions'
  
    expect(page).to have_content("Transactions")
    expect(page).to have_content("AAPL")
    expect(page).to have_content("69")
  end
end
