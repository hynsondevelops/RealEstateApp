class Listing < ApplicationRecord


	belongs_to :state
	belongs_to :city
	belongs_to :zipcode
end
