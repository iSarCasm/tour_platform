FactoryGirl.define do
  factory :tour_coach do
    departure_date  { Faker::Time.between(DateTime.now, DateTime.now + 3, :day) }
    arrival_date    { Faker::Time.between(DateTime.now + 4, DateTime.now + 10, :day) }
    seats           { Faker::Number.between(5, 10) * 5 }
    active_tour
    coach
  end
end
