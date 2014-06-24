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
    @project = Project.find(params[:project_id])
    if logged_in?
      if member_of?(current_user, @project)
        events = @project.events.order(occurred_on: :desc)
        @events = Kaminari.paginate_array(events).page(params[:page]).per(100)
        if @events == []
          flash.now[:success] = %Q[You do not have any events for this project yet. Please visit the #{view_context.link_to("documentation page", project_documentation_path(@project))} to learn how to add events.].html_safe
        end
      else
        redirect_to projects_path, locals: flash[:error] = "You are not a member of that project"
      end
    else
      redirect_to root_path, locals: flash[:error] = "You must be logged in to view events."
    end
  end

  private

  def member_of?(user, project)
    Membership.where(:project_id => project.id, :user_id => user.id).count > 0
  end

end