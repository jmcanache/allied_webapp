class RemoveAirlineFromBooking < ActiveRecord::Migration
  def change
    remove_column :bookings, :airline, :string
  end
end
