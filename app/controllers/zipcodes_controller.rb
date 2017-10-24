class ZipcodesController < ApplicationController
	def show
		@following = Following.new
		@listings = Listing.where(zipcode_id: params[:id])
	end
end
