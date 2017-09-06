class City < ApplicationRecord
	has_many :listings
	belongs_to :state
end
