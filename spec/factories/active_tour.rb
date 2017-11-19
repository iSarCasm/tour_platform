FactoryBot.define do
  factory :active_tour do
    start_date  { Faker::Time.between(DateTime.now, DateTime.now + 3, :day) }
    end_date    { Faker::Time.between(DateTime.now + 4, DateTime.now + 20, :day) }
    tour
  end
end
