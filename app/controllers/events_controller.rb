require 'json'

class EventsController < ApplicationController
  def create
    if Project.find_by(:project_api => params[:api_key])
      render :json => []
    else
      render :json => {}, status: 500
    end
  end

  def index

    project_id = params[:project_id]
    @project = Project.find_by(:id => project_id)
    @events = Event.find_by(:project_id => project_id)
    p @project.events
    puts '*' * 50
    p @events
  end

end