class UsersController < ApplicationController

	def contact
		cur = User.find(params[:current_user_id])
		lister = User.find(params[:lister_id])
		UserMailer.contact_lister(cur, lister, params[:message])
	end

	def listed
		@listed = []
		@listed.push(Listing.find_by(user_id: current_user.id))
	end
end
