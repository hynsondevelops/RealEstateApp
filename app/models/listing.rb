class Listing < ApplicationRecord
	validates :address, presence: true
	validates :bedroom_count, presence: true
	validates :bathroom_count, presence: true
	validates :area_square_feet, presence: true
	validates :description, presence: true
	validates :price, presence: true
	validates :state_id, presence: true
	validates :city_id, presence: true
	validates :zipcode_id, presence: true
	validates :latitude, presence: true
	validates :longitude, presence: true

	belongs_to :state
	belongs_to :city
	belongs_to :zipcode


	geocoded_by :fullAddress
	before_validation :geocode, :if => lambda{|obj| obj.address_changed? && obj.city_id_changed? && obj.zipcode_id_changed? && obj.state_id_changed?}
	after_validation :geocode, :if => lambda{|obj| obj.address_changed? && obj.city_id_changed? && obj.zipcode_id_changed? && obj.state_id_changed?}



	def fullAddress	
		[address, city.name, state.name, zipcode.number].join(', ')
	end

end
