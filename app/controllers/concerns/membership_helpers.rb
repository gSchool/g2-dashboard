module MembershipHelpers
  def member_of?(user, project)
    Membership.where(:project_id => project.id, :user_id => user.id).count > 0
  end

  def validate_membership(user, project)
    redirect_to root_path, locals: flash[:error] = "You are not a member of that project" if !member_of?(user, project)
  end
end