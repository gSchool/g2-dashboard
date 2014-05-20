class Project < ActiveRecord::Base
  validates :project_name, :uniqueness => { case_sensitive: false }
  validates :project_api, :uniqueness => true
end
