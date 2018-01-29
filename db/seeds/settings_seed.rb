begin
  puts 'Creating Coach options...'
  coach_options = CoachOption.create! [
    { title: 'Polite Driver' },
    { title: 'Air conditioner' },
    { title: 'Clean window' },
    { title: 'Good seat' }
  ]
rescue StandardError => exception
  puts exception.to_s.colorize(:red)
  puts exception.backtrace.find { |x| x =~ /seeds.rb/ }.to_s.colorize(:red)
ensure
  puts "Coach options: #{CoachOption.count}".colorize(:green)
end

begin
  puts 'Creating Dining options...'
  dining_options = DiningOption.create! [
    { title: 'Tasty' },
    { title: 'No peanuts' },
    { title: 'No sugar' },
    { title: 'No salt' }
  ]
rescue StandardError => exception
  puts exception.to_s.colorize(:red)
  puts exception.backtrace.find { |x| x =~ /seeds.rb/ }.to_s.colorize(:red)
ensure
  puts "Dining options: #{DiningOption.count}".colorize(:green)
end

begin
  puts 'Creating Hotel options...'
  hotel_options = HotelOption.create! [
    { title: 'Bath preferred' },
    { title: 'Sea view' },
    { title: 'Balcony if possible' },
    { title: 'Many pillows' }
  ]
rescue StandardError => exception
  puts exception.to_s.colorize(:red)
  puts exception.backtrace.find { |x| x =~ /seeds.rb/ }.to_s.colorize(:red)
ensure
  puts "Hotel options: #{HotelOption.count}".colorize(:green)
end

begin
  puts 'Creating Payment types...'
  payment_types = PaymentType.create! [
    { payment_type: 'Pre-pay' },
    { payment_type: 'Credit invoice' }
  ]
rescue StandardError => exception
  puts exception.to_s.colorize(:red)
  puts exception.backtrace.find { |x| x =~ /seeds.rb/ }.to_s.colorize(:red)
ensure
  puts "Payment types: #{PaymentType.count}".colorize(:green)
end

begin
  puts 'Creating Genders...'
  genders = Gender.create! [
    { gender: 'Female' },
    { gender: 'Male' }
  ]
rescue StandardError => exception
  puts exception.to_s.colorize(:red)
  puts exception.backtrace.find { |x| x =~ /seeds.rb/ }.to_s.colorize(:red)
ensure
  puts "Genders: #{Gender.count}".colorize(:green)
end

begin
  puts 'Creating Countries...'
  countires = Country.create! [
    { name: 'UK' },
    { name: 'Italy' },
    { name: 'France' },
    { name: 'Germany' },
    { name: 'US' }
  ]
rescue StandardError => exception
  puts exception.to_s.colorize(:red)
  puts exception.backtrace.find { |x| x =~ /seeds.rb/ }.to_s.colorize(:red)
ensure
  puts "Countries: #{Country.count}".colorize(:green)
end

begin
  puts 'Creating Categories...'
  categories = Category.create! [
    { name: 'Fabulous' },
    { name: 'CHEAP AND HOT' },
    { name: 'For family' },
    { name: 'Solo' },
    { name: 'Wild and crazy' }
  ]
rescue StandardError => exception
  puts exception.to_s.colorize(:red)
  puts exception.backtrace.find { |x| x =~ /seeds.rb/ }.to_s.colorize(:red)
ensure
  puts "Categories: #{Category.count}".colorize(:green)
end

begin
  puts 'Creating Amenities...'
  amenities = Amenity.create! [
    { name: 'Tables' },
    { name: 'WC' },
    { name: 'Air conditioner' },
    { name: 'Wi-Fi' }
  ]
rescue StandardError => exception
  puts exception.to_s.colorize(:red)
  puts exception.backtrace.find { |x| x =~ /seeds.rb/ }.to_s.colorize(:red)
ensure
  puts "Amenities: #{Amenity.count}".colorize(:green)
end

begin
  puts 'Creating Tour Types...'
  tour_types = TourType.create! [
    { name: 'VIP' },
    { name: 'Seasonal' },
    { name: 'Nearby' }
  ]
rescue StandardError => exception
  puts exception.to_s.colorize(:red)
  puts exception.backtrace.find { |x| x =~ /seeds.rb/ }.to_s.colorize(:red)
ensure
  puts "Tour Types: #{TourType.count}".colorize(:green)
end
