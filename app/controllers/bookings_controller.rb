class BookingsController < ApplicationController

  def index
    render layout: false
  end

  def new
    @booking = Booking.new
    @booking.build_creditcard
  	@hotels = Hotel.all.order(:name)
    @first_hotel = @hotels.first
    @airline = Airline.all.order(:name)
  end

  def create
    records_overlaping = Booking.in_range(booking_params[:datein],booking_params[:dateout], booking_params[:hotel_id])
    records_overlaping_airline = BookingsAirline.in_range(booking_params[:datein],booking_params[:dateout], booking_params[:hotel_id])
    new_booking = false

    #single and double rooms 0
    if booking_params[:single] == "0" and booking_params[:double] == "0"
      return redirect_to :action => 'new', alert: "Something wrong happened, please try again"
    end

    #Find hotel total rooms
    hotel = Hotel.find(booking_params[:hotel_id])
    if records_overlaping.blank?
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
      @booking = Booking.new(booking_params)
      if @booking.save
        if params[:info_email_status] == "1"
          new_newsletter = Newsletter.email_exist?(booking_params[:email])
          if !new_newsletter then Newsletter.create(email: booking_params[:email]) end
        end
        #hotel_recipient = [hotel.email, hotel.name]
        #guest_recipient = [@booking.email, @booking.name]
        #allied_recipient = ['m.rolo@allied-hospitality.com', 'Allied Hospitality']

        guest_recipient = [@booking.email, @booking.name]
        hotel_recipient = [hotel.email, hotel.name]
        allied_recipient = ['m.rolo@allied-hospitality.com, j.santiago@allied-hospitality.com', 'Allied Hospitality']
        #allied_recipient = ['canache39@gmail.com', 'Allied Hospitality']
        #hotel_recipient = ['canache39@gmail.com', hotel.name]

        Notifier.send_booking_request(hotel_recipient[0], hotel_recipient[1], @booking, hotel.name).deliver_now
        Notifier.send_booking_request(guest_recipient[0], guest_recipient[1], @booking, hotel.name).deliver_now
        Notifier.send_booking_request(allied_recipient[0], allied_recipient[1], @booking, hotel.name).deliver_now

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

  def report
    @records = []
    @hotels = Hotel.all.order(:name)
    @airlines = Airline.all.order(:name)
  end

  def process_report
    @date_in = params[:date_in]
    @date_out = params[:date_out]
    hotel_id = params[:hotel]
    @all_records = []
    if params[:customers_airlines] == "0"
      hotel_id == "0" ?  records = Booking.in_range_report(@date_in,@date_out) : records = Booking.in_range(@date_in,@date_out,hotel_id)
      @airline = false
    else
      hotel_id == "0" ?  records = BookingsAirline.in_range_report(@date_in,@date_out) : records = BookingsAirline.in_range(@date_in,@date_out,hotel_id)
      @airline = true
    end
    records.each do |f|
      @all_records << f
    end
    @all_records = @all_records.sort_by &:datein
  end

  def contact_email
    if Notifier.contact_us(params).deliver
      respond_to do |format|
        format.json { render json: 1 }
      end
    else
      respond_to do |format|
          format.json { render json: 0 }
        end
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
    params.require(:booking).permit(:email, :name, :flight_type, :airport, :hotel_id, :single, :double, :datein, :dateout, :comments, :airline_id, creditcard_attributes: [:name, :card_number, :zip_code, :verification_code])
  end
end