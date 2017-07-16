FactoryGirl.define do
  factory :tour_hotel do
    start_date  { Faker::Time.between(DateTime.now, DateTime.now + 3, :day) }
    end_date    { Faker::Time.between(DateTime.now + 4, DateTime.now + 10, :day) }
    hotel
    active_tour
  end
end
