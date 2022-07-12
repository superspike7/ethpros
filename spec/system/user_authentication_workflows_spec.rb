require 'rails_helper'

RSpec.describe "UserAuthenticationWorkflows", type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario "a new user creates his new account" do
    visit "/"

    click_on "Signup"
    expect(page).to have_content("Be Part of our Team")

    fill_in "Email", with: "johndoe@gmail.com"
    fill_in "Password", with: "secret123"
    fill_in "Password confirmation", with: "secret123"
    
    expect { within('form') { click_on('Sign up') } }.to change(User, :count).by(1)
                                                     .and change(ActionMailer::Base.deliveries, :count).by(1)
    expect(page).to have_current_path(home_path)
  end
end
