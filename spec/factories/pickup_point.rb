FactoryGirl.define do
  factory :pickup_point do
    address   { Faker::Address.street_address }
    latitude  { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    pickup_list
  end
end
