FactoryGirl.define do
  factory :role do
    name { Faker::Company.name }
  end
end
