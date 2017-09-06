class State < ApplicationRecord
	has_many :listings
	has_many :cities
	has_many :zipcodes
end
