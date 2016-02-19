class Notifier < ApplicationMailer
	def send_booking_request(user, booking)
		@user = user
		@booking = booking
		logger.debug(@booking.inspect)
		mail( :to => @user.email,
		:subject => 'New booking request')
	end
end