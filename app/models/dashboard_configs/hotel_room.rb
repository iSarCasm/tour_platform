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
#  adult_buy     :decimal(, )      default(0.0)
#  adult_supp    :decimal(, )      default(0.0)
#  child_buy     :decimal(, )      default(0.0)
#  infant_buy    :decimal(, )      default(0.0)
#  senior_buy    :decimal(, )      default(0.0)
#  senior_supp   :decimal(, )      default(0.0)
#  hotel_id      :integer
#  adult_sell    :decimal(, )      default(0.0)
#  senior_sell   :decimal(, )      default(0.0)
#  child_sell    :decimal(, )      default(0.0)
#  infant_sell   :decimal(, )      default(0.0)
#

RailsAdmin.config do |config|
  config.model HotelRoom do
    parent TourHotel
    list do
      field :tour_hotel
      field :room_type
      field :pax
      field :amount
      field :adult_buy
      field :adult_sell
      field :senior_buy
      field :senior_sell
      field :senior_supp
      field :adult_supp
      field :child_buy
      field :child_sell
      field :infant_buy
      field :infant_sell
      field :hotel_bookings_count do
        label 'Orders'
      end
    end

    edit do
      field :tour_hotel
      field :amount
      field :room_type
      field :adult_buy
      field :adult_sell
      field :adult_supp
      field :senior_buy
      field :senior_sell
      field :senior_supp
      field :child_buy
      field :child_sell
      field :infant_buy
      field :infant_sell
    end

    nested do
      field :amount
      field :room_type
      field :adult_buy
      field :adult_sell
      field :adult_supp
      field :senior_buy
      field :senior_sell
      field :senior_supp
      field :child_buy
      field :child_sell
      field :infant_buy
      field :infant_sell
    end
  end
end
