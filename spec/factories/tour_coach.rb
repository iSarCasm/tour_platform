FactoryGirl.define do
  factory :tour_coach do
    departure_date  { Faker::Time.between(DateTime.now, DateTime.now + 3, :day) }
    arrival_date    { Faker::Time.between(DateTime.now + 4, DateTime.now + 10, :day) }
    driver_name     { Faker::Name.name }
    seatplan
    active_tour
    coach

    factory :tour_coach_without_seats do
      after(:build) do |tc|
        tc.seatplan = build :seatplan, plan: '_'
      end

      after(:create) do |tc|
        tc.seatplan = create :seatplan, plan: '_'
      end
    end

    factory :tour_coach_with_pickup_list do
      before(:create) do |tour_coach|
        create :pickup_list, tour_coach: tour_coach
      end
    end
  end
end
