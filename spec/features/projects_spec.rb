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
      @user = create_user
      sign_in(@user)
    end

    scenario 'user creates a project, automatically becomes a member and can view it' do
      visit '/'
      click_on 'Add New Project'
      fill_in 'Name of Project', with: 'Aryas Project'
      click_on 'Add Project'

      expect(page).to have_content 'Aryas Project'
      expect(page).to have_content 'Arya Stark'
      expect(page).to have_content 'API Key'
      within('table') do
        expect(page).to have_content 'Name'
        expect(page).to have_content 'Email'
      end
    end

    scenario 'User see a project they are a member of' do
      project = create_project(:project_name => 'Project Time')
      create_membership(:user_id => @user.id, :project_id => project.id)
      visit project_path(project)

      expect(page).to have_content 'Project Time'
    end

    scenario 'User cannot see a project they are not a member of' do
      user2 = create_user
      project = create_project(:project_name => 'Project Time')
      create_membership(:user_id => user2.id, :project_id => project.id)
      visit project_path(project)

      expect(page).to have_content 'You can only view projects you are a member of'
    end

    feature 'managing project memberships' do
      scenario 'Users can add and remove members from a project' do
        create_user(first_name: 'Sansa', email: 'Sansa@example.com')

        visit '/'
        click_on 'Add New Project'
        fill_in 'Name of Project', with: 'Aryas Project'
        click_on 'Add Project'

        select 'Sansa', from: 'Add User'
        click_on 'Add as member'
        within('table') do
          expect(page).to have_content 'Sansa'
          expect(page).to have_content 'Sansa@example.com'
        end

        click_on 'Remove Sansa'
        expect(page).to_not have_content 'Sansa@example.com'
      end

      scenario 'User can view project specific documentation from project page' do
        create_user(first_name: 'Harold', email: 'Henderson@Harold.com')
        visit '/'
        click_on 'Add New Project'
        fill_in 'Name of Project', with: 'Aryas Project'
        click_on 'Add Project'
        click_on 'Documentation'
        expect(page).to have_content "Post endpoint: #{current_host}/api/events"
        expect(page).to have_content "cURL: $ curl -X POST -d @json_file.json http://www.example.com/api/events --header \"Content-Type:application/json\""
      end
    end
  end
end

