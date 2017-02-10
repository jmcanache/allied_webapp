class BookingsAirline < ActiveRecord::Base
  belongs_to :airline
  belongs_to :hotel

  validates_presence_of :flight_type, :single, :double

  validates :comments,
  			length: { maximum: 300 }

  scope :in_range, -> (datein, dateout, hotel_id) {
    where(
      "bookings_airlines.status = 1 and bookings_airlines.hotel_id = #{hotel_id}"
    ).where(
      "DATEDIFF(bookings_airlines.datein, '#{dateout}') * DATEDIFF('#{datein}', bookings_airlines.dateout) >= 0"
    )
  }

  scope :in_range_report, -> (datein, dateout) {
    where(
      "bookings_airlines.status = 1"
    ).where(
      "DATEDIFF(bookings_airlines.datein, '#{dateout}') * DATEDIFF('#{datein}', bookings_airlines.dateout) >= 0"
    )
  }
end
