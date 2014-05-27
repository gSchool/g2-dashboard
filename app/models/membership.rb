class Membership < ActiveRecord::Base

  belongs_to :users
  belongs_to :projects
end