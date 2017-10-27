class UserMailer < ApplicationMailer
	def contact_lister(user, lister, message)
		@user = user
		@message = message
		@url  = 'http://example.com/login'
		mail(to: @user.email, subject: 'Contact')
	end
end
