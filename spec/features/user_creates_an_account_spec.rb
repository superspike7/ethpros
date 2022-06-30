require 'rails_helper'

RSpec.feature "UserCreatesAnAccounts", type: :feature do

  it "allows user to create their account" do
    visit new_user_registration_path
    expect(page).to have_text("Be Part of our Team")
  end

end
