FactoryGirl.define do
  factory :tour_coach do
    departure_date  { Faker::Time.between(DateTime.now, DateTime.now + 3, :day) }
    arrival_date    { Faker::Time.between(DateTime.now + 4, DateTime.now + 10, :day) }
    seatplan
    active_tour
    coach

    before(:create) do |tour_coach|
      create :pickup_list, tour_coach: tour_coach
    end

    factory :tour_coach_without_seats do
      after(:build) do |tc|
        tc.seatplan = build :seatplan, plan: '_'
      end

      after(:create) do |tc|
        tc.seatplan = create :seatplan, plan: '_'
      end
    end
  end
end
