require 'json'
require 'date'

class EventsController < ApplicationController

  def create
    project = Project.find_by(:project_api => params[:api_key])
    if project
      success = Event.create(
        :occurred_on => Time.at(params[:occurred_on].to_i),
        :user_id => params[:user_id],
        :properties => params[:properties],
        :event_type => params[:event_type],
        :project_id => project.id
      )
      if success
        render :json => {}
      else
        render :json => {}, status: 500
      end
    else
      render :json => {}, status: 500
    end
  end

  def index
    if logged_in?
      project_id = params[:project_id]
      @project = Project.find_by(:id => project_id)
      events = @project.events
      @events = Kaminari.paginate_array(events).page(params[:page]).per(100)
    else
      redirect_to root_path, locals: flash[:error] = "You must be logged in to view events."
    end
  end

end