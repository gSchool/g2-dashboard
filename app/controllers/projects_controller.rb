class ProjectsController < ApplicationController

  def index
    if logged_in?
      @memberships = Membership.where(user_id: current_user.id)
      @projects = Project.where(id: @memberships.map(&:project_id))
    else
      redirect_to root_path
    end
  end

  def new
    if session[:user_id]
      @project = Project.new
    else
      redirect_to root_path
    end
  end

  def create
    @project = Project.new
    @project.project_name = params[:project][:project_name]
    @project.project_api = SecureRandom.uuid
    if @project.save
      Membership.create!(user_id: session[:user_id], project_id: @project.id)
      redirect_to project_path(@project)
    else
      render new_project_path
    end
  end

  def show
    @project = Project.find(params[:id])
    if member_of?(current_user, @project)
      @membership = Membership.new
      applicable_memberships = @project.memberships
      @members = applicable_memberships.map do |membership|
        User.find(membership.user_id)
      end
      @users = User.all - @members
    else
      redirect_to root_path
    end
  end

  private

  def member_of?(user, project)
    Membership.where(:project_id => project.id, :user_id => user.id).count > 0
  end
end
