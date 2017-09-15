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
	#validates :latitude, presence: true
	#validates :longitude, presence: true

	belongs_to :state
	belongs_to :city
	belongs_to :zipcode


	geocoded_by :fullAddress
	before_validation :geocode, :if => lambda{|obj| obj.address_changed? && obj.city_id_changed? && obj.zipcode_id_changed? && obj.state_id_changed?}
	after_validation :geocode, :if => lambda{|obj| obj.address_changed? && obj.city_id_changed? && obj.zipcode_id_changed? && obj.state_id_changed?}

	attr_accessor :state_abbreviation
	attr_accessor :city_name
	attr_accessor :zipcode_number


	def fullAddress	
		[address, city.name, state.abbreviation, zipcode.number].join(', ')
	end

	def textToID(params)
		state = State.find_by(abbreviation: params[:listing][:state_abbreviation])
		city = City.find_by(name: params[:listing][:city_name])
		zipcode = Zipcode.find_by(number: params[:listing][:zipcode_number])
		if (state != nil)
			self.state_id = state.id
		end
		if (city != nil)
			self.city_id = city.id
		end
		if (zipcode != nil)
			self.zipcode_id = zipcode.id
		end
	end


end
