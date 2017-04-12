class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :email
      t.references :hotel, index: true, foreign_key: true
      t.string :single
      t.string :double
      t.date :datein
      t.date :dateout
      t.string :creditcard
      t.string :flight_type
      t.string :airport

      t.timestamps null: false
    end
  end
end
