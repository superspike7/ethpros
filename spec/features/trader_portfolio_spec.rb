require 'rails_helper'

RSpec.feature "TraderPortfolio", type: :feature do
  scenario 'Trader Bought a stock ' do
    transaction = create(:transaction)
    sign_in transaction.user 

    visit 'stocks'

    expect(page).to have_content("AAPL")
    expect(page).to have_content("69")
  end
end
