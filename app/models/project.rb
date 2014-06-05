class Project < ActiveRecord::Base
  validates :project_name, :presence => true
  validates :project_name, :uniqueness => {case_sensitive: false}
  validates :project_api, :uniqueness => true

  has_many :memberships
  has_many :users, through: :memberships
  has_many :events
end
