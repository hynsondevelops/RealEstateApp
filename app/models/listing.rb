class Listing < ApplicationRecord
	validates :address, presence: true
	validates :complete_address, presence: true
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
	validates :rent_or_sell, inclusion: { in: [ true, false ] }
	belongs_to :state
	belongs_to :city
	belongs_to :zipcode
	belongs_to :lister, foreign_key: "user_id", class_name: "User"

	geocoded_by :fullAddress
	#before_validation :geocode, :if => lambda{|obj| obj.address_changed? && obj.city_id_changed? && obj.zipcode_id_changed? && obj.state_id_changed?}
	after_validation :geocode, :if => lambda{|obj| obj.address_changed? && obj.city_id_changed? && obj.zipcode_id_changed? && obj.state_id_changed?}

	attr_accessor :state_abbreviation
	attr_accessor :city_name
	attr_accessor :zipcode_number

	scope :rentals, -> {where(rent_or_sell: false)}
	scope :for_sales, -> {where(rent_or_sell: true)}

	has_many :pictures, :dependent => :destroy
	accepts_nested_attributes_for :pictures, :allow_destroy => true


	def fullAddress	
		print("->#{address}<-")
		print("->#{city_name}<-")
		print("->#{state_abbreviation}<-")
		print("->#{zipcode_number}<-")
		city = city_name
		state = state_abbreviation
		zipcode = zipcode_number
		if (address == nil || city == nil || state == nil || zipcode == nil)
			return false
		end
		return [address, city, state, zipcode].join(', ')
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
		["complete_address LIKE ?", "%#{address}%"]
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

	def self.stateSearch(state_abbreviation)
		["state_abbreviation > ?", state_abbreviation]		
	end

	def self.buyRent(rent_or_sell)
		["rent_or_sell = ?", rent_or_sell]		
	end

	def self.simpleSearch(search_params)
		queriesString = ""
		queriesObjects = []
		firstQuery = true;
		queriesString, queriesObjects = addressSearch(search_params);
		Listing.where(queriesString, queriesObjects)
	end


	#and_or 1 for AND, 0 for OR
	def self.finalSearch(search_params, and_or)
		if (search_params[:rent] == "true" && search_params[:buy] == "false") #rentals only
			print("rent")
			search_params[:rent_or_sell] = false
		elsif (search_params[:rent] == "false" && search_params[:buy] == "true") #sales only
			print("sales")
			search_params[:rent_or_sell] = true
		else
			print("both")
			search_params[:rent_or_sell] = ""
		end
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
		if (search_params[:rent_or_sell] != "")
			tempQuery = buyRent(search_params[:rent_or_sell])
			print("1. ")
			print("#{tempQuery[0]}")
			print("2. ")
			print("#{tempQuery[1]}")
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
