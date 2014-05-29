require 'spec_helper'

feature 'Events Page' do
  scenario 'there are only 100 events per page' do
    user = create_user
    visit '/'
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'password', with: 'yepperz'
    click_on 'Submit'
    create_project
    click_on 'View Projects'
    click_on 'Murder Joffrey'
    click_on 'View Events'
    page.all("tr").count.should eql(100)
  end
end