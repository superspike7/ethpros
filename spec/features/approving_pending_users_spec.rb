require 'rails_helper'

RSpec.feature "ApprovingPendingUsers", type: :feature do
  scenario 'Admin Approves the Pending Users' do
    admin = create(:user, role: 1, pending: 1)
    pending_user = create(:user, role: 0, pending: 0, email: 'kristine@gmail.com')
    sign_in admin

    visit 'admin/pending'
    expect(page).to have_content('kristine@gmail.com')

    click_on('Approve')
    expect(page).to have_content('User has been approved')
  end

end
