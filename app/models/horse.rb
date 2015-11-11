class Horse < ActiveRecord::Base
  belongs_to :client
  has_many :appointments
  validates :name, presence: true,
                    length: { minimum: 2 }
end
