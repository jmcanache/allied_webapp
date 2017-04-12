class AddAirlineReferencesToBooking < ActiveRecord::Migration
  def change
    add_reference :bookings, :airline, index: true, foreign_key: true
  end
end
