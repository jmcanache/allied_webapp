class ChangeStatusDefaultInBookingsAirlines < ActiveRecord::Migration
  def change
  	change_column :bookings_airlines, :status, :integer, :default => 1
  end
end
