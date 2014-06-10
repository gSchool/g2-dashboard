require 'spec_helper'

feature 'Project functions' do
  feature 'Guest functions' do
    scenario 'Guests cannot create projects' do
      visit projects_path
      expect(page).to have_no_link 'Add New Project'
    end
  end


  feature 'User functions' do
    before do
      user = create_user
      sign_in(user)
    end

    scenario 'allows a user to create a project and that user is automatically added to created project' do
      new_project

      within('table') do
        expect(page).to have_content('Arya Stark')
      end
    end

    scenario 'User can see error for incorrect Project creation' do
      create_project

      new_project
      expect(page).to have_content('Project name has already been taken')
    end

    scenario 'Users can view a single project' do
      new_project
      expect(page).to have_content 'Murder Joffrey'
      expect(page).to have_content 'API Key'
      within('table') do
        expect(page).to have_content 'Name'
        expect(page).to have_content 'Email'
      end
    end

    scenario 'User can see a project they are a member of' do
      user = create_user(:email => 'hihihi@gmail.com')
      project = create_project(:project_name => 'Project Time')
      create_membership(:user_id => user.id, :project_id => project.id)
      visit project_path(project)

      expect(page).to have_content 'Project Time'
    end


    feature 'managing project memberships' do
      scenario 'Users can add members to a project' do
        create_user(first_name: 'Sansa', email: 'Sansa@example.com')
        new_project
        select 'Sansa', from: 'Add User'
        click_on 'Add as member'
        within('table') do
          expect(page).to have_content 'Sansa'
          expect(page).to have_content 'Sansa@example.com'
        end
      end

      scenario 'User cannot add duplicate members to a project' do
        create_user(first_name: 'Sansa', email: 'Sansa@example.com')
        new_project
        within('form') do
          expect(page).to have_content 'Sansa'
          expect(page).to have_no_content 'Arya'
        end
      end

      scenario 'User can delete members from a project' do
        create_user(first_name: 'Harold', email: 'Henderson@Harold.com')
        new_project
        select 'Harold', from: 'Add User'
        click_on 'Add as member'
        click_on 'Remove Harold'
        expect(page).to_not have_content 'Henderson@Harold.com'
      end
    end
  end
end