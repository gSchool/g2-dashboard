require 'spec_helper'

feature 'about page' do
  scenario 'user can click on the about page link' do
    visit '/'
    click_on 'About'
    expect(page).to have_content 'This is the about page for the dashboard'
  end
end