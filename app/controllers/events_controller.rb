require 'json'
require 'date'


class EventsController < ApplicationController

  def create
    project = Project.find_by(:project_api => params[:api_key])
    occurred_on = Time.at(params[:occurred_on].to_i)
    user_id = params[:user_id]
    properties = params[:properties]
    event_type = params[:event_type]
    if project
      Event.create(:occurred_on => occurred_on, :user_id => user_id, :properties => properties, :event_type => event_type, :project_id => project.id)
      render :json => {}
    else
      render :json => {}, status: 500
    end
  end

end

