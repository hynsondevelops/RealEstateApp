class CitiesController < ApplicationController
	def show
		@following = Following.new
		@listings = (Listing.where(city_id: params[:id]))
	end
end
