require 'spec_helper'

describe Membership do
  it 'Does not allow duplicate user/project combinations' do
    user_id = create_user.id
    project_id = create_project.id

    Membership.create!(:user_id => user_id, :project_id => project_id)
    same_membership = Membership.new(:user_id => user_id, :project_id => project_id)
    expect(same_membership.valid?).to eq false
  end
  it 'Allows a user to have multiple memberships for different projects' do
    user_id = create_user.id
    project_id = create_project.id

    Membership.create!(:user_id => user_id)
    different_membership = Membership.new(:user_id => user_id, :project_id => project_id)
    expect(different_membership.valid?).to eq true
  end
end