require 'spec_helper'

describe 'Events API' do
  it 'returns a status code 200 for successful post requests' do
    project = create_project
    params = {
      occurred_on: 89765467,
      event_type: "User Registered",
      properties: {
                      variation: "a"
                     },
      api_key: "#{project.project_api}"
    }

    post "/api/events", params.to_json
    expect(response.status).to eq 200
  end
  it 'returns a status code 500 mismatching api_key post requests'
end