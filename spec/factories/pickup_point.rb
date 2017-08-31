FactoryGirl.define do
  factory :pickup_point do
    pickup_list
    address   { Faker::Address.street_address }
    latitude  { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
