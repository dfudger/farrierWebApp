class Client < ActiveRecord::Base
	has_many :horses, dependent: :destroy
	validates :name, presence: true,
                    length: { minimum: 2 }
end
