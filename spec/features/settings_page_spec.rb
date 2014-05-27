require 'spec_helper'

feature 'settings page' do
  scenario 'a user can see their email address, data usage, and API token' do
    user = create_user
    visit '/'
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'password', with: 'yepperz'
    click_on 'Submit'
    click_on 'Settings'
    expect(page).to have_content "Email Address: "
    expect(page).to have_content "Data Usage: "
    expect(page).to have_content "API Token: "
  end

end