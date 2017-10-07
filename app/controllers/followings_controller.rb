class FollowingsController < ApplicationController

	def create 
		@following = Following.create(following_params)
	end

	def index
		@followed_listings = current_user.followed_listings
	end

	private

	  def following_params
	    params.require(:following).permit(:user_id, :listing_id)

	  end
end
