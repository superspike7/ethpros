require 'rails_helper'

RSpec.feature 'StockBuyingOnMarketplaces', type: :feature do
  scenario 'Trader Visits the Marketplace' do
    sign_in create(:user)

    visit 'market/stocks'

  end
end
