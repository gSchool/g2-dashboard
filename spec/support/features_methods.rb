def register_user
  @first_name = 'Arya'
  @last_name = 'Stark'

  visit '/'
  click_on 'Sign Up'
  fill_in 'First Name', with: @first_name
  fill_in 'Last Name', with: @last_name
  fill_in 'Email', with: 'awesomesauce@example.com'
  fill_in 'Password', with: 'yepperz'
  fill_in 'Password Confirmation', with: 'yepperz'
  click_on 'Submit'
end
