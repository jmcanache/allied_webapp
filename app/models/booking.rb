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

  scope :between, -> (datein, dateout) { where("bookings.status = 1").where( "bookings.datein < '#{dateout}' AND bookings.dateout > '#{datein}'") }
end
