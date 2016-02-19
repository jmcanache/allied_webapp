class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  	@hotels = Hotel.all
  end

  def create
    records_overlaping = Booking.in_range(booking_params[:datein],booking_params[:dateout], booking_params[:hotel_id])
    new_booking = false

    if records_overlaping.blank?
      new_booking = true
    else #There are records overlaping, gotta check room availability.
      
      #Find hotel total rooms
      hotel = Hotel.find(booking_params[:hotel_id])

      #Count how many rooms are currently busy
      single = double = 0
      records_overlaping.each do |r|
        single += r[:single]
        double += r[:double]
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
        Notifier.send_booking_request(hotel, @booking).deliver_now
        redirect_to :action => 'new'
      else
         @hotels = Hotel.all
         render :action => 'new'
      end
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
    params.require(:booking).permit(:email, :flight_type, :airport, :hotel_id, :single, :double, :datein, :dateout, :creditcard, :comments)
  end
end
