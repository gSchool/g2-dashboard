module FeaturesMethods
  def register_user(updated_attributes = {})
    default_attributes = {
        :first_name => 'Arya',
        :last_name => 'Stark',
        :email => 'awesomesauce@example.com',
        :password => 'yepperz',
        :password_confirmation => 'yepperz'
    }

    attributes = default_attributes.merge(updated_attributes)

    visit '/'
    click_on 'Sign Up'
    fill_in 'First Name', with: attributes[:first_name]
    fill_in 'Last Name', with: attributes[:last_name]
    fill_in 'Email', with: attributes[:email]
    fill_in 'Password', with: attributes[:password]
    fill_in 'Password Confirmation', with: attributes[:password_confirmation]
    check 'terms'
    click_on 'Submit'
  end

  def sign_in(user)
    visit login_path
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Submit'
  end

  def log_out(user)
    session.clear
  end
end