class ZipcodesController < ApplicationController
	def show
		@following = Following.new
		@listings = []
		@listings.push(Listing.find_by(zipcode_id: params[:id]))
	end
end
