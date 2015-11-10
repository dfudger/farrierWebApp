class Horse < ActiveRecord::Base
  belongs_to :client
  has_many :comments
end
