class FollowingsController < ApplicationController

	def create 
		@following = Following.create(following_params)
	end

	private

	  def following_params
	    params.require(:following).permit(:user_id, :listing_id)

	  end
end
