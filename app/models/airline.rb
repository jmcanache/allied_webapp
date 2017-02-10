class Airline < ActiveRecord::Base
	has_one :booking
	has_one :booking_airline
end
