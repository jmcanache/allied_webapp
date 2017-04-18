class Notifier < ApplicationMailer
	def send_booking_request(recipient, gretings, booking, hotel)
		@gretings = gretings
		@booking = booking
		@hotel = hotel

		mail( :to => recipient,
			:subject => 'New booking request')
	end

	def send_booking_request_airline(recipient, gretings, booking, hotel)
		@gretings = gretings
		@booking = booking
		@hotel = hotel

		mail( :to => recipient,
			:subject => 'New booking request')
	end

	def contact_us(params)
		@data = params
		mail( :to => 'canache39@gmail.com', :subject => params[:subject])
	end
end