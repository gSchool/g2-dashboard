require 'spec_helper'

feature 'User functions' do

  scenario 'allows users to sign up' do
    register_user
    expect(page).to have_content("Hello, #{@first_name} #{@last_name}")
  end

  scenario 'displays an error when user password and password confirmation do not match' do
    visit '/'
    click_on 'Sign Up'
    fill_in 'First Name', with: @first_name
    fill_in 'Last Name', with: @last_name
    fill_in 'Email', with: 'awesomesauce@example.com'
    fill_in 'Password', with: 'yepperz'
    fill_in 'Password Confirmation', with: 'noperz'
    click_on 'Submit'
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  it 'a newly registered user is automatically logged in' do
    register_user
    expect(page).to have_content("Hello, #{@first_name} #{@last_name}")
    expect(page).to have_no_link("Sign Up")
  end

  it 'a user can logout' do
    register_user
    click_on 'Sign Out'
    expect(page).to have_no_content("Hello, #{@first_name} #{@last_name}")
    expect(page).to have_link("Sign Up")
  end
end
