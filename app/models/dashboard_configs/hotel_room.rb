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
