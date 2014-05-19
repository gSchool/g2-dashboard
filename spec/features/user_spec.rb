require 'spec_helper'

feature 'User functions' do
  before do
    @first_name = 'Arya'
    @last_name = 'Stark'
    @email = 'awesomesauce@example.com'
    @password = 'yepperz'

    visit '/'
    click_on 'Sign Up'
    fill_in 'First Name', with: @first_name
    fill_in 'Last Name', with: @last_name
    fill_in 'Email', with: @email
    fill_in 'Password', with: @password
  end

  it 'allows users to sign up' do
    fill_in 'Password Confirmation', with: @password
    click_on 'Submit'

    expect(page).to have_content("Hello, #{@first_name} #{@last_name}")
  end

  it 'displays an error when user password and password confirmation do not match' do
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
