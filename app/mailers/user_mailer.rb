class UserMailer < ApplicationMailer
	def contact_lister(user, lister, message)
		@user = user
		@lister = lister
		@message = message
		@url  = 'http://example.com/login'
		mail(to: lister.email, subject: 'Contact')
	end
end
