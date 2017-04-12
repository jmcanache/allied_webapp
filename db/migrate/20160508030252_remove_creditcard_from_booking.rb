class RemoveCreditcardFromBooking < ActiveRecord::Migration
  def change
    remove_column :bookings, :creditcard, :string
  end
end
