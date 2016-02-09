class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  	@hotels = Hotel.all

  end

  def create
    if Booking.between(booking_params[:datein]),booking_params[:dateout]).any?
      puts "hay fechas"
    else
      puts "no hay fechas"
    end
    # current_datein = booking_params[:datein].to_date
    # current_dateout = booking_params[:dateout].to_date
    # datein_ok = dateout_ok = false

    # Booking.where(:status => 1).find_each do |booking|
    #   datein_ok = Time.now.between?(booking[:datein],booking[:dateout])
    #   dateout_ok = current_dateout.between?(booking[:datein],booking[:dateout])
    #
    #   if datein_ok or dateout_ok
    #     #Rebota al usuario. No procesa.
    #   else
    #     #Procede, envia email y guarda
    #   end
    # end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private
  def booking_params
    params.require(:booking).permit(:email, :flight_type, :airport, :hotel_id, :single, :double, :datein, :dateout, :creditcard)
  end
end
