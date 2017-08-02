FactoryGirl.define do
  factory :hotel_room do
    amount      { Faker::Number.between(1, 400) }
    room_type
    tour_hotel
  end
end
