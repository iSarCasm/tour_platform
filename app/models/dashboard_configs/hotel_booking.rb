# == Schema Information
#
# Table name: hotel_bookings
#
#  id              :integer          not null, primary key
#  hotel_room_id   :integer
#  tour_booking_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

RailsAdmin.config do |config|
  config.model HotelBooking do
    parent TourBooking
    list do
      field :id
      field :tour_booking
      field :hotel_room
      field :hotel_options
      field :dining_options
      field :created_at
      field :updated_at
    end

    show do
      set_template 'hotel_booking_show'
      field :id
      field :tour_booking
      field :hotel_room
      field :hotel_options
      field :dining_options
      field :created_at
      field :updated_at
    end

    create { set_template 'hotel_booking' }
    update { set_template 'hotel_booking' }

    edit do
      field :tour_booking
      field :hotel_room
      field :hotel_options
      field :dining_options
    end
  end
end
