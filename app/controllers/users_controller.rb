class UsersController < ApplicationController

	def listed
		@listed = []
		@listed.push(Listing.find_by(user_id: current_user.id))
	end
end
