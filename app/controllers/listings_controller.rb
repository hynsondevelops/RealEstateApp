class ListingsController < ApplicationController

	def new
		@listing = Listing.new
	end

	def create
		@listing = Listing.new(listing_params)
		@listing.textToID(params)
		if (@listing.save)
			# Handle a successful save.
			#@listing.send_activation_email
			flash[:info] = "Listing created!"
			redirect_to action: "show", id: @listing.id
		else
			render 'new'
		end
	end

	def show
		@listing = Listing.find(params[:id])
	end

	def edit
		@listing = Listing.find(params[:id])
	end

	def update
		@listing = Listing.find(params[:id])
		@listing.textToID(params)
		if @listing.update_attributes(listing_params)

		      #successful update here
		      flash[:success] = "Profile updated"
		      redirect_to action: "show", id: @listing.id
		else
		      render 'edit'
		end
	end

	def 

	def index
		@listings = Listing.all
	end

	private

	  def listing_params
	    params.require(:listing).permit(:address, :bedroom_count, :bathroom_count, :area_square_feet, :description, :price, :shipping_price, :state_abbreviation, :city_name, :zipcode_number)
	  end

end
