require 'rails_helper'

RSpec.feature 'StockBuyingOnMarketplaces', type: :feature do
  scenario 'Trader Visits the Marketplace and Buys a stock' do
    create(:stock)
    sign_in create(:user)

    visit 'market/stocks'

    click_on('AAPL')
    expect(page).to have_content('Open')
    expect(page).to have_content('AAPL')
    expect(page).to have_content('Apple Inc')
    expect(page).to have_link('Buy')

    click_on('Buy')
    expect(page).to have_content('Buy AAPL Stocks')

    fill_in('Amount', with: 10)
    click_on('Buy')
    expect(page.current_path).to eq(stocks_path)
    expect(page).to have_content 'your transaction is successful'
    within 'tr#AAPL' do
      expect(page).to have_content('10')
    end
  end
end
