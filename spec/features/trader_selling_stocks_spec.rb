require 'rails_helper'

RSpec.feature 'TraderSellingStocks', type: :feature do
  scenario 'Trader Bought a stock ' do
    user = create(:user)
    transaction = create(:transaction, user_id: user.id)
    sign_in user

    visit 'stocks'

    within 'tr#AAPL' do
      click_on 'Sell'
    end
    expect(page).to have_content('Sell AAPL Stocks')

    fill_in('Amount', with: 9)
    click_on('Sell')
    
    expect(page.current_path).to eq(stocks_path)
    expect(page).to have_content 'your transaction is successful'
    within 'tr#AAPL' do
      expect(page).to have_content('60')
    end
  end
end
