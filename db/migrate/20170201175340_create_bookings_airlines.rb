class CreateBookingsAirlines < ActiveRecord::Migration
  def change
    create_table :bookings_airlines do |t|
      t.references :airline, index: true, foreign_key: true
      t.references :hotel, index: true, foreign_key: true
      t.integer :single
      t.integer :double
      t.date :datein
      t.date :dateout
      t.integer :flight_type
      t.string :comments
      t.integer :status
      t.string :airport

      t.timestamps null: false
    end
  end
end
