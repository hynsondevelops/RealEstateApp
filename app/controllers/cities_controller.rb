class CitiesController < ApplicationController
	def show
		@following = Following.new

		@listings = []
		@listings.push(Listing.find_by(city_id: params[:id]))
	end
end
