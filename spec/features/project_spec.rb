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

end
