class BookingsController < ApplicationController

  def index
    render layout: false
  end

  def new
    @booking = Booking.new
    @booking.build_creditcard
  	@hotels = Hotel.all.order(:name)
    @airline = ['Aerolineas Argentinas', 
                'Aeromexico',
                'Air Berlin',
                'Air France',
                'Alitalia',
                'American Airlines',
                'American Eagle',
                'Avianca',
                'Bahamas Air',
                'British Airways',
                'Copa Airlines',
                'Gol Airlines',
                'Iberia',
                'Interjet',
                'Lan Argentina',
                'Lan Chile',
                'Lan Colombia',
                'Lan Ecuador',
                'Lan Peru',
                'Luthansa',
                'Qatar Airways',
                'Santa Barbara Airlines',
                'Swiss Air',
                'Taca',
                'Tam Brazilian Airlines',
                'Tap Air Portugal',
                'Transaero',
                'United Airlines',
                'Virgin Atlantic']
    @default_airline = @airline[0]
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
        if params[:info_email_status] == "1"
          new_newsletter = Newsletter.email_exist?(booking_params[:email])
          if !new_newsletter then Newsletter.create(email: booking_params[:email]) end
        end
        #hotel_recipient = [hotel.email, hotel.name]
        #guest_recipient = [@booking.email, @booking.name]
        #allied_recipient = ['m.rolo@allied-hospitality.com', 'Allied Hospitality']

        guest_recipient = [@booking.email, @booking.name]
        hotel_recipient = ['gfernandez@yirehcs.com', hotel.name]
        allied_recipient = ['m.rolo@allied-hospitality.com', 'Allied Hospitality']

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
  end

  def process_report
    @date_in = params[:date_in]
    @date_out = params[:date_out]
    @hotel_id = params[:hotel]
    @hotel_id == "0" ?  @records = Booking.in_range_report(@date_in,@date_out) : @records = Booking.in_range(@date_in,@date_out,@hotel_id)
    @records.each do |record|
      hotel = Hotel.find(record[:hotel_id])
      #for now the name is stored in comments because this filed is not used it in the report
      record[:comments] = hotel[:name]
    end
    #reorder array by hotel name
     @records = @records.sort_by &:comments
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

  private
  def booking_params
    params.require(:booking).permit(:email, :name, :flight_type, :airport, :hotel_id, :single, :double, :datein, :dateout, :comments, :airline, creditcard_attributes: [:name, :card_number, :zip_code, :verification_code])
  end
end