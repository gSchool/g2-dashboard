require 'spec_helper'

describe 'Events API' do
  it 'Will successfully create an event' do
    project = create_project
    api_key = project.project_api
    attributes = {
      occurred_on: 89765467,
      event_type: "User Registered",
      user_id: "user",
      properties: {
        sttingIn: "a"
      },
      api_key: "#{api_key}"}
    post '/api/events', JSON.generate(attributes), {'HTTP_ACCEPT' => "application/json", 'Content-Type' => 'application/json'}

    expect(response).to be_success

  end

  it 'Will unsuccessfully create an event' do
    bad_api_key = 'jaodijfadsoijdsio8773'
    attributes = {
      occurred_on: 89765467,
      event_type: "User Registered",
      user_id: "user",
      properties: {
        sttingIn: "a"
      },
      api_key: bad_api_key
    }

    post '/api/events', JSON.generate(attributes), {'HTTP_ACCEPT' => "application/json", 'Content-Type' => 'application/json'}

    expect(response).to_not be_success

  end
end