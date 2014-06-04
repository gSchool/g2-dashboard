require 'spec_helper'

describe Event do
  before do
   project_api =  create_project.project_api
  end
  it 'user can add an event to a project' do
    Event.create!(:api_project_id => project_api)
  end
end