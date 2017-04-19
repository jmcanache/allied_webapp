class BookingsAirlinesController < ApplicationController
	def new
		@booking = BookingsAirline.new
	  	@hotels = Hotel.all.order(:name)
	    @first_hotel = @hotels.first
	    @airlines = Airline.all.order(:name)
	end

	def create
		if !verify_recaptcha
	      return redirect_to :action => 'new', alert: "Recaptcha failed"
	    end

		records_overlaping = Booking.in_range(booking_params[:datein],booking_params[:dateout], booking_params[:hotel_id])
		records_overlaping_airline = BookingsAirline.in_range(booking_params[:datein],booking_params[:dateout], booking_params[:hotel_id])
	    new_booking = false

	    #single and double rooms 0
	    if booking_params[:single] == "0" and booking_params[:double] == "0"
	      return redirect_to :action => 'new', alert: "Something wrong happened, please try again"
	    end

	    #Find hotel total rooms
	    hotel = Hotel.find(booking_params[:hotel_id])
	    if records_overlaping.blank? and records_overlaping_airline.blank?
	      if hotel[:single] >= booking_params[:single].to_i and hotel[:double] >= booking_params[:double].to_i
	        new_booking = true
	      end
	    else #There are records overlaping, gotta check room availability.
	      
	      #Count how many rooms are currently busy
	      single = double = 0
	      records_overlaping.each do |r|
	        single += r[:single].to_i
	        double += r[:double].to_i
	      end
	      records_overlaping_airline.each do |r|
	        single += r[:single].to_i
	        double += r[:double].to_i
	      end

	      #Number of rooms available
	      single_available = hotel[:single] - single
	      double_available = hotel[:double] - double

	      #Check availability against client request
	      exist_single = single_available - booking_params[:single].to_i
	      exist_double = double_available - booking_params[:double].to_i

	      if exist_single >= 0 and exist_double >= 0
	        #if available save new booking
	        new_booking = true
	      end
	    end

	    if new_booking
	      @booking = BookingsAirline.new(booking_params)
	      airline = params[:airline_id]
	      if @booking.save
	        #guest_recipient = [airline.email, airline.name]
	        hotel_recipient = [hotel.email, hotel.name]
	        allied_recipient = ['m.rolo@allied-hospitality.com, j.santiago@allied-hospitality.com', 'Allied Hospitality']
	        
	        #allied_recipient = ['canache39@gmail.com', 'Allied Hospitality']
        	#hotel_recipient = ['canache39@gmail.com', hotel.name]

	        Notifier.send_booking_request_airline(hotel_recipient[0], hotel_recipient[1], @booking, hotel.name).deliver_now
	        #Notifier.send_booking_request_airline(guest_recipient[0], guest_recipient[1], @booking, hotel.name).deliver_now
	        Notifier.send_booking_request_airline(allied_recipient[0], allied_recipient[1], @booking, hotel.name).deliver_now

	        redirect_to :action => 'new', notice: "You had request a new booking" 
	      else
	         @hotels = Hotel.all
	         redirect_to :action => 'new', alert: "Something wrong happened, please try again"
	      end
	    else
	      redirect_to :action => 'new', alert: "There is no room availability, please change your dates"
	    end
	end

	def get_prices
	    hotel = Hotel.find_hotel(params[:id])
	    prices = {price_single: hotel[:price_single], price_double: hotel[:price_double]}
	    respond_to do |format|
	        format.json { render json: prices }
	    end
	 end

	private
  		def booking_params
    		params.require(:bookings_airline).permit(:airline_id, :flight_type, :airport, :hotel_id, :single, :double, :datein, :dateout, :comments)
  		end
end