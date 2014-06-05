require 'spec_helper'

feature 'User can view events' do

  before do
    create_user
    create_project
    create_event
  end

  scenario 'for each project the user will see 100 events per page' do

    visit login_path
    fill_in 'Email', with: 'awesomesauce@example.com'
    fill_in 'Password', with: 'yepperz'
    click_on 'Submit'

    click_on 'View Projects'
    click_on 'Murder Joffrey'
    click_on 'Events'
    save_and_open_page
    page.should have_selector('table', :count => 100)
  end
end