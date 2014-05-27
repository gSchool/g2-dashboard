class ProjectsController < ApplicationController

  def index
    @projects = Project.all
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
      redirect_to projects_path
    else
      render new_project_path
    end
  end

  def show
    @project = Project.find(params[:id])
    @membership = Membership.new
    applicable_memberships = @project.memberships
    if applicable_memberships
      @members = applicable_memberships.map do |membership|
        User.find(membership.user_id)
      end
    else
      @members = []
    end
    @users = User.all - @members
  end
end
