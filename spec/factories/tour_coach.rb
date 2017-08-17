FactoryGirl.define do
  factory :tour_coach do
    departure_date  { Faker::Time.between(DateTime.now, DateTime.now + 3, :day) }
    arrival_date    { Faker::Time.between(DateTime.now + 4, DateTime.now + 10, :day) }
    seatplan
    active_tour
    coach
  end
end
