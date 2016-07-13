class Notifier < ApplicationMailer
	def send_booking_request(recipient, gretings, booking, hotel)
		@gretings = gretings
		@booking = booking
		@hotel = hotel

		mail( :to => recipient,
			:subject => 'New booking request')

	end

	def contact_us(params)
		@data = params
		mail( :to => 'm.rolo@allied-hospitality.com', :subject => params[:subject])
	end
end