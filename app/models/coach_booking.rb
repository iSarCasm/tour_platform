# == Schema Information
#
# Table name: coach_bookings
#
#  id              :integer          not null, primary key
#  tour_coach_id   :integer
#  tour_booking_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  seats           :json
#

class CoachBooking < ApplicationRecord
  belongs_to :tour_coach, inverse_of: :coach_bookings
  belongs_to :tour_booking, inverse_of: :coach_bookings
  belongs_to :pickup_point, inverse_of: :coach_bookings

  has_many :coach_option_coach_booking
  has_many :coach_options, through: :coach_option_coach_booking, inverse_of: :coach_booking

  validates :tour_coach, :tour_booking, :seats, presence: true

  validate :ensure_has_seats, on: :create
  validate :cant_book_same_seat

  def title
    "#{tour_booking.username} -> #{tour_coach.title}"
  rescue
    'New Coach Booking'
  end

  def tour_coach_title
    tour_coach.title
  end

  def tour_booking_title
    tour_booking.title
  end

  def seat_objects
    seats_array.map do |row_col|
      Seat.new(seatplan: seatplan, row_col: row_col, tour_coach: tour_coach)
    end
  end

  def seats_array
    (seats.is_a?(String) ? JSON.parse(seats) : seats) || []
  end

  def seats_amount
    seats_array.size
  end

  def seatplan
    tour_coach.seatplan
  end

  def total_cost
    seats_array.reduce(0) do |sum, x|
      sum + tour_coach.seat_price(x)
    end
  end

  def ensure_has_seats
    return unless seats
    if tour_coach.seats_left < seats_amount
      errors.add :seats, 'Seats for this coach sold out'
    end
  end

  def cant_book_same_seat
    already_booked = tour_coach.coach_bookings.any? do |other_booking|
      next if other_booking == self
      other_booking.seats_array.any? do |other_booking_seat|
        seats_array.include? other_booking_seat
      end
    end
    if already_booked
      errors.add :seats, 'This seat is already booked'
    end
  end
end
