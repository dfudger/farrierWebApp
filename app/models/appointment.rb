class Appointment < ActiveRecord::Base
  belongs_to :horse
  validates :start, presence: true
end
