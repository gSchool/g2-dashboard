require 'spec_helper'

feature 'Project functions' do
  scenario 'allows a user to create a project' do
    create_project

    expect(page).to have_content('Murder Joffrey')
  end

  scenario 'User can see error for incorrect Project creation' do
    create_project

    create_project
    expect(page).to have_content('Project name has already been taken')
  end

  scenario 'Users can view a single project' do
    create_project
    click_on 'Murder Joffrey'
    expect(page).to have_content 'Murder Joffrey'
    within('table') do
      expect(page).to have_content 'Name'
      expect(page).to have_content 'Email'
    end
  end

  scenario 'Users can add members to a project' do
    create_user
    create_user(first_name: 'Sansa', email: 'Sansa@example.com')
    create_project
    click_on 'Murder Joffrey'
    select 'Sansa', from: 'Add User'
    click_on 'Add as member'
    within('table') do
      expect(page).to have_content 'Sansa'
      expect(page).to have_content 'Sansa@example.com'
    end
  end
end