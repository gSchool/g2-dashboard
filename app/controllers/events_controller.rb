require 'json'

class EventsController < ApplicationController
  def create
    response = JSON.parse(request.raw_post)

    if Project.find_by(:project_api => response['api_key'])
      respond_to do |format|
        format.json { render json: '', status: :created }
      end
    else
      respond_to do |format|
        format.json { render json: '', status: :internal_server_error }
      end
    end
  end
end