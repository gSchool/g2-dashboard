require 'spec_helper'
require 'json'

describe EventsController do
  it 'returns a status code 200 for successful post requests' do
    project = create_project
    params = {
      occurred_on: 2.days.ago,
      event_type: "User Registered",
      properties: {
        variation: "a"
      },
      api_key: "#{project.project_api}"
    }
    post :create, params, format: :json

    expect(response.status).to eq 200
  end

  it 'returns a status code 500 mismatching api_key post requests' do
    project = create_project
    params = {
      occurred_on: 2.days.ago,
      event_type: "User Registered",
      properties: {
        variation: "a"
      },
      api_key: "12345686867238672"
    }

    post :create, params, format: :json

    expect(response.status).to eq 500
  end


end
