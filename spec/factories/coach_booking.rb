FactoryGirl.define do
  factory :coach_booking do
    tour_coach
    tour_booking
    seats         { Faker::Number.between(1,6) }
  end
end
