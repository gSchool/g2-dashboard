require 'spec_helper'

feature 'User functions' do

  it 'allows users to sign up' do
    first_name = 'Arya'
    last_name = 'Stark'
    email = 'awesomesauce@example.com'
    password = 'yepperz'

    visit '/'
    click_on 'Sign Up'
    fill_in 'First Name', with: first_name
    fill_in 'Last Name', with: last_name
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password Confirmation', with: password
    click_on 'Submit'

    expect(page).to have_content("Hello, #{first_name} #{last_name}")
  end
end
