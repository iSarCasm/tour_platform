FactoryGirl.define do
  factory :hotel_room do
    places      { Faker::Number.between(1, 6) }
    number      { Faker::Number.between(1, 400) }
    room_type   { Faker::Number.between(1,2) }
    tour_hotel
  end
end
