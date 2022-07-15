require 'rails_helper'

RSpec.feature "TraderWithdrawDeposits", type: :feature do
  scenario 'Trader deposits cash to his balance' do
    user = create(:user, balance: 100)
    sign_in user

    visit root_path
    expect(page).to have_content("$100")

    click_on "Deposit"
    expect(page).to have_content("Deposit Cash")
  end
end
