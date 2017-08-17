FactoryGirl.define do
  factory :coach_booking do
    tour_coach
    tour_booking
    seats         { "[\"#{1 + rand(10)}_#{1 + rand(999_999_999)}\"]" }
  end
end
