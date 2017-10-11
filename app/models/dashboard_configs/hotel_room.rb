# == Schema Information
#
# Table name: hotel_rooms
#
#  id            :integer          not null, primary key
#  tour_hotel_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  amount        :integer
#  room_type_id  :integer
#  adult         :decimal(, )      default(0.0)
#  adult_supp    :decimal(, )      default(0.0)
#  child         :decimal(, )      default(0.0)
#  child_supp    :decimal(, )      default(0.0)
#  infant        :decimal(, )      default(0.0)
#  infant_supp   :decimal(, )      default(0.0)
#  senior        :decimal(, )      default(0.0)
#  senior_supp   :decimal(, )      default(0.0)
#  hotel_id      :integer
#

RailsAdmin.config do |config|
  config.model HotelRoom do
    parent TourHotel
    list do
      field :tour_hotel
      field :room_type
      field :pax
      field :amount
      field :adult
      field :adult_supp
      field :child
      field :child_supp
      field :infant
      field :infant_supp
      field :senior
      field :senior_supp
      field :hotel_bookings_count do
        label 'Orders'
      end
    end

    edit do
      field :tour_hotel
      field :room_type
      field :amount
      field :adult
      field :adult_supp
      field :child
      field :child_supp
      field :infant
      field :infant_supp
      field :senior
      field :senior_supp
    end

    nested do
      exclude_fields :hotel, :tour_hotel
    end
  end
end
