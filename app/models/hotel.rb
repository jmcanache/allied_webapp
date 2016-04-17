class Hotel < ActiveRecord::Base
	has_many :bookings

	validates :single, numericality: { only_integer: true }
	validates :double, numericality: { only_integer: true }

	def self.valid_user(data)
		find_by(email:data[:email], password:data[:password])
	end

	def self.find_hotel(hotel_id)
		find(hotel_id)
	end

	def self.update_data(params, id)
		update(id, single: params[:single], double: params[:double]).valid?
	end
end
