FactoryBot.define do
  factory :hotel_room do
    amount      { Faker::Number.between(1, 400) }
    adult_buy   100
    adult_sell  100
    adult_supp  10
    child_buy   100
    child_sell  100
    infant_buy  100
    infant_sell 100
    senior_buy  100
    senior_sell 100
    senior_supp 10
    room_type
    tour_hotel
    hotel
  end
end
