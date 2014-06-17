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

  scenario 'a newly registered user is automatically logged in' do
    first_name = 'Arya'
    last_name = 'Stark'
    register_user(:first_name => first_name, :last_name => last_name)
    expect(page).to have_content("Hello, #{first_name} #{last_name}")
    expect(page).to have_no_link("Sign Up")
  end

  scenario 'a user can logout' do
    first_name = 'Arya'
    last_name = 'Stark'
    register_user(:first_name => first_name, :last_name => last_name)
    click_on 'Sign Out'
    expect(page).to have_no_content("Hello, #{first_name} #{last_name}")
    expect(page).to have_link("Sign Up")
  end

  scenario 'user can see a link to terms of service' do
    visit '/users/new'
    click_on 'Terms of Service'
    expect(page).to have_content('Welcome to gSchool Dashboard, a West End Pearl corporation')
  end

  scenario 'user can sign in' do
    user = create_user
    visit '/'
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'password', with: 'yepperz'
    click_on 'Submit'
    expect(page).to have_content("Login Successful")
  end

  scenario 'user sees error when logging in with non-existent email' do
    user = create_user
    visit '/'
    click_on 'Sign In'
    fill_in 'Email', with: "notauser@example.com"
    fill_in 'Password', with: user.password
    click_on 'Submit'
    expect(page).to have_content("Invalid Email and Password Combination")
  end
  
  scenario 'user sees error when logging in with incorrect password' do
    user = create_user
    visit '/'
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'nope'
    click_on 'Submit'
    expect(page).to have_content("Invalid Email and Password Combination")
  end

  scenario 'user sees error when signing up without agreeing to Terms of Service' do
    visit '/'
    click_on 'Sign Up'
    fill_in 'First Name', with: 'Arya'
    fill_in 'Last Name', with: 'Stark'
    fill_in 'Email', with: 'awesomesauce@example.com'
    fill_in 'Password', with: 'yepperz'
    fill_in 'Password Confirmation', with: 'yepperz'
    click_on 'Submit'
    expect(page).to have_content("must be accepted")
  end
end