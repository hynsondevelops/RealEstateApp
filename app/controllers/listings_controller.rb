class ListingsController < ApplicationController

	def new
		@listing = Listing.new
	end

	def create
		@listing = Listing.new(listing_params)
		@listing.textToID(params, 0)
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
		if (@listing.textToID(params, 1))
			if (@listing.update_attributes(listing_params))
				#successful update here
				flash[:success] = "Profile updated"
				redirect_to action: "show", id: @listing.id
			else
				@listing.save
				flash[:listing_errors_count] = @listing.errors.count
				flash[:listing_errors_messages] = @listing.errors.full_messages 
				redirect_to action: "edit", id: @listing.id
			end
		else
			@listing.save
			flash[:listing_errors_count] = @listing.errors.count
			flash[:listing_errors_messages] = @listing.errors.full_messages 
			redirect_to action: "edit", id: @listing.id
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
