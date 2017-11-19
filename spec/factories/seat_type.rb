FactoryBot.define do
  factory :seat_type do
    name    { SecureRandom.hex(5) } # for uniqueness
    char    { (65 + rand(26)).chr }
    price   10
    is_seat true
  end
end
