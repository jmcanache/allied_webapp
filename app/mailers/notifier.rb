class Notifier < ApplicationMailer
	def send_booking_request(recipient, gretings, booking, hotel)
		@gretings = gretings
		@booking = booking
		@hotel = hotel

		mail( :to => recipient,
			:subject => 'New booking request')

	end
end