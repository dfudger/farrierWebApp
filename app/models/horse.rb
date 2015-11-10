class Horse < ActiveRecord::Base
  belongs_to :client
  has_many :appointments
end
