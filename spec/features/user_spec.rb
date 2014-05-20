require 'spec_helper'

feature 'User functions' do

  scenario 'allows users to sign up' do
    first_name = 'Arya'
    last_name = 'Stark'
    register_user(:first_name => first_name, :last_name => last_name)
    expect(page).to have_content("Hello, #{first_name} #{last_name}")
  end

  scenario 'displays an error when user password and password confirmation do not match' do
    register_user(:password_confirmation => 'nope')
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  it 'a newly registered user is automatically logged in' do
    first_name = 'Arya'
    last_name = 'Stark'
    register_user(:first_name => first_name, :last_name => last_name)
    expect(page).to have_content("Hello, #{first_name} #{last_name}")
    expect(page).to have_no_link("Sign Up")
  end

  it 'a user can logout' do
    first_name = 'Arya'
    last_name = 'Stark'
    register_user(:first_name => first_name, :last_name => last_name)
    click_on 'Sign Out'
    expect(page).to have_no_content("Hello, #{first_name} #{last_name}")
    expect(page).to have_button("Sign Up")
  end

  scenario 'user can see a link to terms of service' do
    visit '/users/new'

    click_on 'Terms of Service'
    expect(page).to have_content('Welcome to gSchool Dashboard, a West End Pearl corporation')
  end
end
