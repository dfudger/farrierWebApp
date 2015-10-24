class Client < ActiveRecord::Base
	has_many :horses
	validates :name, presence: true,
                    length: { minimum: 2 }
end
