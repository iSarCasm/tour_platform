FactoryBot.define do
  factory :tour do
    title       { Faker::LordOfTheRings.location }
  end
end
