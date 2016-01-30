class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  	@hotels = Hotel.all
  	
  end

  def create
     @booking = Booking.new(booking_params)
     if @booking.save
        redirect_to :action => 'new'
     else
        @hotels = Hotel.all
        render :action => 'new'
     end
  end

  private
  def booking_params
     params.require(:booking).permit(:email, :flight_type, :airport, :hotel_id, :single, :double, :datein, :dateout, :creditcard)
  end

  def edit
  end

  def update
  end

  def delete
  end
end