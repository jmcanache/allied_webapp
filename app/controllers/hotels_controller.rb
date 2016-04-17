class HotelsController < ApplicationController
  def add
  	@hotels = Hotel.all
  end

  def edit
  end

  def update
  end

  def delete
  end

  def sing_in
  	if !session[:hotel_id].blank?
  		redirect_to action: 'rooms'
  	end
  	if !session[:admin].blank?
  		redirect_to action: 'all_rooms'
  	end
  end

  def sing_out
  	session.delete(:hotel_id)
  	session.delete(:admin)
  	redirect_to action: 'sing_in'
  end

  def check_user
  	if params[:email] == "admin@email.com" and params[:password] == "1234"
		session[:admin] = true
		redirect_to action: 'all_rooms'
	else
		user = Hotel.valid_user(params)
		if user
	  		session[:hotel_id] = user.id
	  		redirect_to action: 'rooms'
	  	else
			redirect_to action: 'sing_in', alert: "Email or password incorrect."
	  	end
	end
  end

  def all_rooms
  	if session[:admin].blank?
  		redirect_to action: 'sing_in', warning: "Only admins have access"
	else
		@hotels = Hotel.all
	end
  end

  def rooms
  	if session[:hotel_id].blank?
  		redirect_to action: 'sing_in', warning: "Only users have access."
  	else
  		@hotel = Hotel.find_hotel(session[:hotel_id])
  	end
  end

  def update_rooms
  	hotel = Hotel.update_data(params, session[:hotel_id])
  	if hotel
  		redirect_to action: 'rooms', notice: "Rooms update successfully."
  	else 
  		redirect_to action: 'rooms', alert: "Try again." 
  	end
  end

  def update_rooms_admin
  	hotel = Hotel.update_data(params, params[:hotel])
  	save = hotel ? true : false
	respond_to do |format|
	    format.json { render json: hotel }
	end  
  end

  def get_rooms
  	hotel = Hotel.find_hotel(params[:id])
  	rooms = {single: hotel[:single], doubles: hotel[:double]}
  	respond_to do |format|
	    format.json { render json: rooms }
	end
  end
end
