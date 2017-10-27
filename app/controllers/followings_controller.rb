class FollowingsController < ApplicationController

	def create 
		@following = Following.create(following_params)
	end

	def index
		@followed_listings = current_user.followed_listings.paginate(page: params[:page], per_page: 9)
	end

	private

	  def following_params
	    params.require(:following).permit(:user_id, :listing_id)

	  end
end
