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
	#before_validation :geocode, :if => lambda{|obj| obj.address_changed? && obj.city_id_changed? && obj.zipcode_id_changed? && obj.state_id_changed?}
	after_validation :geocode, :if => lambda{|obj| obj.address_changed? && obj.city_id_changed? && obj.zipcode_id_changed? && obj.state_id_changed?}

	attr_accessor :state_abbreviation
	attr_accessor :city_name
	attr_accessor :zipcode_number


	def fullAddress	
		if (address == nil || city == nil || state == nil || zipcode == nil)
			return false
		end
		[address, city.name, state.abbreviation, zipcode.number].join(', ')
	end

	#updateOrCreate
	#Create = 0
	#Update = 1
	def textToID(params, createOrUpdate)
		state = State.find_by(abbreviation: params[:listing][:state_abbreviation])
		city = City.find_by(name: params[:listing][:city_name])
		zipcode = Zipcode.find_by(number: params[:listing][:zipcode_number])
		valid = true
		if (state != nil)
			self.state_id = state.id
		else
			if (createOrUpdate)
				self.state_id = nil
			end
			valid = false
		end
		if (city != nil)
			self.city_id = city.id
		else
			if (createOrUpdate)
				self.city_id = nil
			end
			valid = false
		end
		if (zipcode != nil)
			self.zipcode_id = zipcode.id
		else
			if (createOrUpdate)
				self.zipcode_id = nil
			end
			valid = false
		end
		return valid
	end

	def address_conditions(address)
	  ["listings.address LIKE ?", "%#{address}%"] unless address.blank?
	end


	def self.search(listing_params)
	  if search
	    a = where("address LIKE ? AND bedroom_count LIKE ? AND bathroom_count LIKE ? AND area_square_feet LIKE ? AND price LIKE ?", "%#{search}%", "%#{bedroom_count}%", "%#{bathroom_count}")
	    return a
	  else
	    find(:all)
	  end
	end
	
	def self.addressSearch(address)
		["address LIKE ?", "%#{address}%"]
	end

	def self.maxPriceSearch(max_price)
		["price < ?", max_price]
	end

	def self.minPriceSearch(min_price)
		["price > ?", min_price]
	end

	def self.maxAreaSquareFeetSearch(area_square_feet)
		["area_square_feet < ?", area_square_feet]
	end

	def self.minAreaSquareFeetSearch(area_square_feet)
		["area_square_feet > ?", area_square_feet]
	end

	def self.minBedroomCountSearch(bedroom_count)
		["bedroom_count > ?", bedroom_count]
	end

	def self.minBathroomCountSearch(bathroom_count)
		["bathroom_count > ?", bathroom_count]
	end


	#and_or 1 for AND, 0 for OR
	def self.finalSearch(search_params, and_or)
		queriesString = ""
		queriesObjects = []
		firstQuery = true;
		if (search_params[:address] != "")
			tempQuery = addressSearch(search_params[:address])
			if (firstQuery)
				queriesString += "#{tempQuery[0]} "
				firstQuery = false
			else
				if (and_or)
					queriesString += " AND"
				else
					queriesString += " OR"
				end
				queriesString += " #{tempQuery[0]} "
			end
			queriesObjects.push(tempQuery[1])
		end
		if (search_params[:max_price] != "")
			tempQuery = maxPriceSearch(search_params[:max_price])
			if (firstQuery)
				queriesString += "#{tempQuery[0]} "
				firstQuery = false
			else
				if (and_or)
					queriesString += " AND"
				else
					queriesString += " OR"
				end
				queriesString += " #{tempQuery[0]} "
			end
			queriesObjects.push(tempQuery[1])
		end
		if (search_params[:min_price] != "")
			tempQuery = minPriceSearch(search_params[:min_price])
			if (firstQuery)
				queriesString += "#{tempQuery[0]} "
				firstQuery = false
			else
				if (and_or)
					queriesString += " AND"
				else
					queriesString += " OR"
				end
				queriesString += " #{tempQuery[0]} "
			end
			queriesObjects.push(tempQuery[1])
		end
		if (search_params[:max_area_square_feet] != "")
			tempQuery = maxAreaSquareFeetSearch(search_params[:max_area_square_feet])
			if (firstQuery)
				queriesString += "#{tempQuery[0]} "
				firstQuery = false
			else
				if (and_or)
					queriesString += " AND"
				else
					queriesString += " OR"
				end
				queriesString += " #{tempQuery[0]} "
			end
			queriesObjects.push(tempQuery[1])
		end
		if (search_params[:min_area_square_feet] != "")
			tempQuery = minAreaSquareFeetSearch(search_params[:min_area_square_feet])
			if (firstQuery)
				queriesString += "#{tempQuery[0]} "
				firstQuery = false
			else
				if (and_or)
					queriesString += " AND"
				else
					queriesString += " OR"
				end
				queriesString += " #{tempQuery[0]} "
			end
			queriesObjects.push(tempQuery[1])
		end
		if (search_params[:min_bedroom_count] != "")
			tempQuery = minBedroomCountSearch(search_params[:min_bedroom_count])
			if (firstQuery)
				queriesString += "#{tempQuery[0]} "
				firstQuery = false
			else
				if (and_or)
					queriesString += " AND"
				else
					queriesString += " OR"
				end
				queriesString += " #{tempQuery[0]} "
			end
			queriesObjects.push(tempQuery[1])
		end
		if (search_params[:min_bathroom_count] != "")
			tempQuery = minBathroomCountSearch(search_params[:min_bathroom_count])
			if (firstQuery)
				queriesString += "#{tempQuery[0]} "
				firstQuery = false
			else
				if (and_or)
					queriesString += " AND"
				else
					queriesString += " OR"
				end
				queriesString += " #{tempQuery[0]} "
			end
			queriesObjects.push(tempQuery[1])
		end
		if (!firstQuery)
			Listing.where(queriesString, *queriesObjects)
		end
	end

	



end
