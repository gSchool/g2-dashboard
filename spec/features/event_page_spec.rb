require 'spec_helper'

feature 'User can view events' do

  before do
    create_user
    create_project
    105.times do
      create_event
    end
  end

  scenario 'for each project the user will see 100 events per page' do

    visit login_path
    fill_in 'Email', with: 'awesomesauce@example.com'
    fill_in 'Password', with: 'yepperz'
    click_on 'Submit'

    click_on 'View Projects'
    click_on 'Murder Joffrey'
    click_on 'Events'

    page.should have_selector('table tr', :count => 3)
  end
end