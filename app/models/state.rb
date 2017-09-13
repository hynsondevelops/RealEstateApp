class State < ApplicationRecord
	validates :name, presence: true
	validates :abbreviation, presence: true

	has_many :listings
	has_many :cities
	has_many :zipcodes
end
