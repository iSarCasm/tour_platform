FactoryBot.define do
  factory :tour_booking do
    user
    active_tour
    adult 2
    child 0
    infant 0
    senior 0
  end
end
