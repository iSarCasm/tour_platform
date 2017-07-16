FactoryGirl.define do
  factory :coach do
    title       { Faker::Company.name }
  end
end
