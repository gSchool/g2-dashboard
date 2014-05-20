require 'spec_helper'

feature 'Project functions' do

  before do
    register_user
  end

  scenario 'allows a user to create a project' do
    visit '/projects'

    click_on 'Add New Project'
    fill_in 'Name of Project', with: 'Murder Joffrey'
    click_on 'Add Project'

    expect(page).to have_content('Murder Joffrey')
  end

  scenario 'User can see error for incorrect Project creation' do
    visit '/projects'
    project_name = 'Murder Joffrey'
    click_on 'Add New Project'
    fill_in 'Name of Project', with: project_name
    click_on 'Add Project'

    click_on 'Add New Project'
    fill_in 'Name of Project', with: project_name
    click_on 'Add Project'
    expect(page).to have_content('Project name has already been taken')
  end

end
