class UsersController < ApplicationController

	def contact
		UserMailer.contact_lister(User.find(params[:current_user_id]), User.find(params[:lister_id], params[:message]))
	end

	def listed
		@listed = []
		@listed.push(Listing.find_by(user_id: current_user.id))
	end
end
