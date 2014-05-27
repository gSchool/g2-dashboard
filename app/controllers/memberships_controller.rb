class MembershipsController < ApplicationController

  def create
    Membership.create(project_id: params[:project_id], user_id: params[:membership][:user_id])
    redirect_to project_path(Project.find(params[:project_id]))
  end
end