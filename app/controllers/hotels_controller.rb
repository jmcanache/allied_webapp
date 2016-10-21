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

  def sign_in
  	if !session[:hotel_id].blank?
  		redirect_to action: 'rooms'
  	end
  	if !session[:admin].blank?
  		redirect_to action: 'all_rooms'
  	end
  end

  def sign_out
  	session.delete(:hotel_id)
  	session.delete(:admin)
    session.delete(:current_user)
  	redirect_to action: 'sign_in'
  end

  def change_password
    if session[:admin].blank? and session[:hotel_id].blank?
      redirect_to action: 'sign_in', warning: "You need to log in first"
    end    
  end

  def update_password
    if !session[:admin].blank?
      admin = Admin.valid_admin_pass(session[:current_user], params)
      if admin
        admin.update_attribute('password', params[:new_password])
        redirect_to action: 'all_rooms', notice: "Password changed"
      else
        redirect_to action: 'change_password', alert: "something went wrong, try again."
      end
    else
      hotel = Hotel.valid_hotel_pass(session[:current_user], params)
      if hotel
        hotel.update_attribute('password', params[:new_password])
        redirect_to action: 'rooms', notice: "Password changed"
      else
        redirect_to action: 'change_password', alert: "something went wrong, try again."
      end
    end
  end

  def check_user
    if Admin.valid_admin(params)
  		session[:admin] = true
      session[:current_user] = params[:email]
  		redirect_to action: 'all_rooms'
  	else
  		user = Hotel.valid_user(params)
  		if user
  	  		session[:hotel_id] = user.id
          session[:current_user] = params[:email]
  	  		redirect_to action: 'rooms'
  	  	else
  			redirect_to action: 'sign_in', alert: "Email or password incorrect."
  	  	end
  	end
  end

  def all_rooms
  	if session[:admin].blank?
  		redirect_to action: 'sign_in', warning: "Only admins have access"
  	else
  		@hotel = Hotel.all
      render action: 'rooms'
  	end
  end

  def rooms
  	if session[:hotel_id].blank?
  		redirect_to action: 'sign_in', warning: "Only users have access."
  	else
  		@hotel = Hotel.where(email: session[:current_user]).all
  	end
  end

  def update_rooms
  	hotel = Hotel.update_data(params, params[:hotel])
  	respond_to do |format|
        format.json { render json: hotel }
    end  
  end

  def get_rooms
    	hotel = Hotel.find_hotel(params[:id])
    	rooms = {single: hotel[:single], doubles: hotel[:double], price_single: hotel[:price_single], price_double: hotel[:price_double]}
    	respond_to do |format|
  	    format.json { render json: rooms }
  	end
  end
end
