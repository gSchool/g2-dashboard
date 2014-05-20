class Project < ActiveRecord::Base
  validates :project_name, :uniqueness => true
  validates :project_api, :uniqueness => true
end
