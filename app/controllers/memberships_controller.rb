class MembershipsController < ApplicationController

  def create
    Membership.create(project_id: params[:project_id], user_id: params[:membership][:user_id])
    redirect_to project_path(Project.find(params[:project_id]))
  end

  def destroy
    member = Membership.find_by_user_id(params["id"])
    member.destroy
    redirect_to project_path(Project.find(params[:project_id]))
  end
end