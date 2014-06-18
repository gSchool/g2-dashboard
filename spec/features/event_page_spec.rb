require 'spec_helper'

feature 'User can view events' do

  scenario 'for each project the user will see 100 events per page' do
    user = create_user(:email => 'test@test.comm')
    sign_in(user)
    project = create_project(:project_name => 'Work in Process')

    Membership.create(:project_id => project.id, :user_id => user.id)
    105.times do
      Event.create!(:project_id => project.id, :occurred_on => Time.now, :user_id => user.id, :event_type => "User Registered", :properties => {:variation => "a", :hello => "b"})
    end
    visit project_events_path(project.id)
    page.should have_selector('table tr', :count => 100)
  end

  scenario 'non project members cannot see events of a project' do
    user = create_user(:email => 'test@test.comm')
    sign_in(user)
    project = create_project(:project_name => 'Work in Process')
    Membership.create(:project_id => project.id, :user_id => user.id)
    105.times do
      Event.create!(:project_id => project.id, :occurred_on => Time.now, :user_id => user.id, :event_type => "User Registered", :properties => {:variation => "a", :hello => "b"})
    end
    visit root_path
    click_on "Logout"

    user2 = create_user(:email => 'test_2@test.comm')
    sign_in(user2)
    visit project_events_path(project.id)
    expect(page).to have_content "You are not a member of that project"
  end
end
