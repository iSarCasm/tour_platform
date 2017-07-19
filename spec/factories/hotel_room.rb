FactoryGirl.define do#{tour_hotel.hotel_title} ##{number}
  factory :hotel_room do
    places      { Faker::Number.between(1, 6) }
    amount      { Faker::Number.between(1, 400) }
    room_type   { Faker::Number.between(0, 1) }
    tour_hotel
  end
end
