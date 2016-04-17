class AddAirlineToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :airline, :string
  end
end
