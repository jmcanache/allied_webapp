class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  	@hotels = Hotel.all
  end

  def create
    records_overlaping = Booking.in_range(booking_params[:datein],booking_params[:dateout], booking_params[:hotel_id])
    new_booking = false

    #Find hotel total rooms
    hotel = Hotel.find(booking_params[:hotel_id])

    if records_overlaping.blank?
      if hotel[:single] > booking_params[:single].to_i and hotel[:double] > booking_params[:double].to_i
        new_booking = true
      end
    else #There are records overlaping, gotta check room availability.
      
      #Count how many rooms are currently busy
      single = double = 0
      records_overlaping.each do |r|
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
      @booking = Booking.new(booking_params)
      if @booking.save    
      
        hotel_recipient = [hotel.email, hotel.name]
        guest_recipient = [@booking.email, @booking.name]
        allied_recipient = ['majoguevara10@gmail.com', 'Allied Hospitality']

        send = [hotel_recipient, guest_recipient, allied_recipient] 
        send.each do |send_to|
          Notifier.send_booking_request(send_to[0], send_to[1], @booking, hotel.name).deliver_now
        end
        
        redirect_to :action => 'new', notice: "You had request a new booking" 
      else
         @hotels = Hotel.all
         redirect_to :action => 'new', alert: "Something wrong happened, please try again"
      end
    else
      redirect_to :action => 'new', alert: "There is no room availability, please change your dates"
    end

  end

  def edit
  end

  def update
  end

  def delete
  end

  private
  def booking_params
    params.require(:booking).permit(:email, :name, :flight_type, :airport, :hotel_id, :single, :double, :datein, :dateout, :creditcard, :comments)
  end
end
