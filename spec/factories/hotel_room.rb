FactoryGirl.define do
  factory :hotel_room do
    amount      { Faker::Number.between(1, 400) }
    adult       100
    adult_supp  10
    child       100
    child_supp  10
    senior      100
    senior_supp 10
    infant      100
    infant_supp 10
    room_type
    tour_hotel
    hotel
  end
end
