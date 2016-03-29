class Booking < ActiveRecord::Base
  belongs_to :hotel

  validates_presence_of :flight_type, :single, :double

  validates :email,
            presence: { message: "Enter your email address" },
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Enter a valid email address" }

  validates :creditcard,
  			numericality: { only_integer: true }, allow_blank: true

  validates :comments,
  			length: { maximum: 300 }

  scope :in_range, -> (datein, dateout, hotel_id) {
    where(
      "bookings.status = 1 and bookings.hotel_id = #{hotel_id}"
    ).where(
      "DATEDIFF(bookings.datein, '#{dateout}') * DATEDIFF('#{datein}', bookings.dateout) >= 0"
    )
  }

  scope :in_range_report, -> (datein, dateout) {
    where(
      "bookings.status = 1"
    ).where(
      "DATEDIFF(bookings.datein, '#{dateout}') * DATEDIFF('#{datein}', bookings.dateout) >= 0"
    )
  }
end