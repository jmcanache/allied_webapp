class AddCommentsToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :comments, :string
  end
end
