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
end