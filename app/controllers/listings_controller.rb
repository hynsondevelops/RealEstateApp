class ListingsController < ApplicationController

	def new
		@listing = Listing.new
	end

	def create
		@listing = Listing.new(listing_params)
		@listing.state_id = State.find_by(abbreviation: params[:listing][:state_abbreviation]).id
		@listing.city_id = City.find_by(name: params[:listing][:city_name]).id
		@listing.zipcode_id = Zipcode.find_by(number: params[:listing][:zipcode_number]).id
		@listing.save
		print(@listing)
	end

	def show
		@listing = Listing.find(params[:id])
	end

	def index
		@listings = Listing.all
	end

	private

	  def listing_params
	    params.require(:listing).permit(:address, :bedroom_count, :bathroom_count, :area_square_feet, :description, :price, :shipping_price, :state_abbreviation, :city_name, :zipcode_number)
	  end

end
