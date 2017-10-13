class ListingsController < ApplicationController

	def new
		@listing = Listing.new
	end

	def create
		@listing = Listing.new(listing_params)
		print("              ->")
		print(@listing.fullAddress)
		print("<-              ")
		@listing.update_attributes(:complete_address => @listing.fullAddress)
		@listing.textToID(params, 0)
		if (@listing.save)
			if params[:images]
			  #===== The magic is here ;)
			  params[:images].each { |image|
			    @listing.pictures.create(image: image)
			  }
			end
			# Handle a successful save.
			#@listing.send_activation_email
			flash[:info] = "Listing created!"
			redirect_to action: "show", id: @listing.id
		else
			render 'new'
		end
	end
	def search
		@searchResults = Listing.finalSearch(search_params, 1)
		@listing = Listing.new
		@listings = @searchResults
		@following = Following.new
		render 'index'
	end

	def simpleSearch
		@searchResults = Listing.finalSearch(search_params, 1)
		@listing = Listing.new
		@listings = Listing.all
		render 'index'

	end

	def search_filter
		@listing = Listing.new
	end

	def index

		@listing = Listing.new
		@listings = Listing.all
		@following = Following.new

	end

	def show
		@listing = Listing.find(params[:id])
		@following = Following.new
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

	def destroy
	    Listing.find(params[:id]).destroy
	    flash[:success] = "User deleted"
	    redirect_to '/listings'
	end
 
	def buy
		@following = Following.new
		@listings = []
		@results = Listing.find_by(rent_or_sell: true)
		if (@results != nil)
			@listings.push(@results)
		end
	end

	def rent
		@following = Following.new
		@listings = []
		@results = Listing.find_by(rent_or_sell: false)
		if (@results != nil)
			@listings.push(@results)
		end	
	end


	private

	  def listing_params
	    params.require(:listing).permit(:address, :bedroom_count, :bathroom_count, :area_square_feet, :description, :price, :shipping_price, :state_abbreviation, :city_name, :zipcode_number, :rent_or_sell, :user_id)

	  end

	  def search_params
	    params.require(:search_params).permit(:address, :max_price, :min_price, :max_area_square_feet, :min_area_square_feet, :min_bedroom_count, :min_bathroom_count, :rent, :buy)
	  end

	  def simple_search_params
	    params.permit(:search)
	  end

end
