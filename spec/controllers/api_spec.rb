require 'spec_helper'

describe EventsController do
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
    #xhr :post, :create, params.to_json
    post :create, params, format: :json

    expect(response.status).to eq 200
  end

  it 'returns a status code 500 mismatching api_key post requests' do
    create_project
    params = {
      occurred_on: 89765467,
      event_type: "User Registered",
      properties: {
        variation: "a"
      },
      api_key: "eajkrnafiudhva32kafebdfvn01"
    }

    post :create, params, format: :json

    expect(response.status).to eq 500
  end
end

