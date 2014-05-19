def create_user
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
