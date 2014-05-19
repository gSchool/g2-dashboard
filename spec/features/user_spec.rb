require 'spec_helper'

feature 'User functions' do
  before do
    create_user
  end

  scenario 'allows users to sign up' do
    fill_in 'Password Confirmation', with: @password
    click_on 'Submit'

    expect(page).to have_content("Hello, #{@first_name} #{@last_name}")
  end

  scenario 'displays an error when user password and password confirmation do not match' do
    fill_in 'Password Confirmation', with: "nosiree"
    click_on 'Submit'

    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  it 'a newly registered user is automatically logged in' do
    fill_in 'Password Confirmation', with: @password
    click_on 'Submit'

    expect(page).to have_content("Hello, #{@first_name} #{@last_name}")
    expect(page).to have_no_link("Sign Up")
  end
end
