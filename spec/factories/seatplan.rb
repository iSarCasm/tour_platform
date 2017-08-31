FactoryGirl.define do
  factory :seatplan do
    title       "Seat Plan Title"
    description "Seat Plan Description"
    plan        "_"

    after(:build) do |seatplan, evaluator|
      create :seat_type, char: '_', is_seat: false unless SeatType.find_by(char: '_')
    end

    before(:create) do |seatplan, evaluator|
      create :seat_type, char: '_', is_seat: false unless SeatType.find_by(char: '_')
    end
  end
end
