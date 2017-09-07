class Listing < ApplicationRecord


	belongs_to :state
	belongs_to :city
	belongs_to :zipcode

	geocoded_by :fullAddress
	after_validation :geocode, :if => lambda{|obj| obj.address_changed? && obj.city_id_changed? && obj.zipcode_id_changed? && obj.state_id_changed?}

	def fullAddress
		[address, city.name, state.name, zipcode.name].join(', ')
	end

end
