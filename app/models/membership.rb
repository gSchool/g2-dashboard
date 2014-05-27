class Membership < ActiveRecord::Base

  validates_uniqueness_of :user_id, :scope => :project_id

  belongs_to :users
  belongs_to :projects
end