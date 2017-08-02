FactoryGirl.define do
  factory :room_type do
    room_type   { 'Single' }
    pax         { Faker::Number.between(1, 6) }
    description { 'Single bed'}
  end
end
