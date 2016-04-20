class Horse < ActiveRecord::Base
  belongs_to :client
  belongs_to :stable
  has_many :appointments, dependent: :destroy
  validates :name, presence: true,
                    length: { minimum: 2 }
end
