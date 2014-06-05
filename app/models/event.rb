class Event < ActiveRecord::Base
  belongs_to :project
  validates :occurred_on, numericality: true
end