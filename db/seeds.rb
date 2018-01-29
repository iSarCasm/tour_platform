require 'faker'
require 'colorize'
require_relative 'seeds/permission_seed'
require_relative 'seeds/settings_seed'

begin
  puts 'Creating Roles...'
  superadmin = Role.create(name: "Superadmin")
  superadmin.permissions << Permission.find_by(subject_class: Permission.subject_classes['everything'], action: Permission.actions['manage'])

  admin = Role.create(name: "Admin")
  [Tour, Hotel, Coach, User, ActiveTour].each do |klass|
    admin.permissions << Permission.find_by(subject_class: Permission.subject_classes[klass.to_s], action: Permission.actions['manage'])
  end
rescue StandardError => exception
  puts exception.to_s.colorize(:red)
  puts exception.backtrace.find { |x| x =~ /seeds.rb/ }.to_s.colorize(:red)
ensure
  puts "Roles: #{Role.count}".colorize(:green)
end

begin
  puts 'Creating Users...'
  admin_1 = User.new(email: 'superadmin@etours.com', first_name: 'admin', last_name: 'paul', password: 'admin')
  admin_1.base_role = :admin
  admin_1.role = superadmin
  admin_1.save!(validate: false)

  admin_2 = User.new(email: 'admin@etours.com', first_name: 'admin', last_name: 'paul', password: 'admin')
  admin_2.base_role = :admin
  admin_2.role = admin
  admin_2.save!(validate: false)

  users = User.create! [
    { first_name: 'Jack', last_name: 'Peterson', email: 'jack014@gmail.com', password: '12341234' },
    { first_name: 'Lisa', last_name: 'Peterson', email: 'lisalol@mail.ru', password: '12341234' },
    { first_name: 'Anna', last_name: 'Peterson', email: 'annathebest@gmail.com', password: '12341234' },
    { first_name: 'Felix', last_name: 'Peterson', email: 'felix@pewdiepie.com', password: '12341234' }
  ]
rescue StandardError => exception
  puts exception.to_s.colorize(:red)
  puts exception.backtrace.find { |x| x =~ /seeds.rb/ }.to_s.colorize(:red)
ensure
  puts "Users: #{User.count}".colorize(:green)
end

begin
  puts 'Creating Board bases...'
  board_bases = BoardBasis.create! [
    {title: 'All Inclusive'},
    {title: 'Full Board'},
    {title: 'Full Board Plus'},
    {title: 'Half Board'},
    {title: 'Bed and Breakfast'},
    {title: 'Self Catering'},
    {title: 'Room Only'}
  ]
rescue StandardError => exception
  puts exception.to_s.colorize(:red)
  puts exception.backtrace.find { |x| x =~ /seeds.rb/ }.to_s.colorize(:red)
ensure
  puts "Board Bases: #{BoardBasis.count}".colorize(:green)
end

begin
  puts 'Creating Payment types...'
  payments = PaymentType.create! [
    {payment_type: 'Credit invoice'},
    {payment_type: 'Pre-Pay'},
  ]
rescue StandardError => exception
  puts exception.to_s.colorize(:red)
  puts exception.backtrace.find { |x| x =~ /seeds.rb/ }.to_s.colorize(:red)
ensure
  puts "Payment types: #{PaymentType.count}".colorize(:green)
end

begin
  puts 'Creating Room types...'
  room_types = RoomType.create! [
    { room_type: 'Single', pax: 1, description: 'Single bed' },
    { room_type: 'Double', pax: 2, description: 'Double bed'},
    { room_type: 'Twin', pax: 2, description: 'Twin Room' },
    { room_type: 'Triple', pax: 3, description: 'Triple Room' }
  ]
rescue StandardError => exception
  puts exception.to_s.colorize(:red)
  puts exception.backtrace.find { |x| x =~ /seeds.rb/ }.to_s.colorize(:red)
ensure
  puts "Room types: #{RoomType.count}".colorize(:green)
end

begin
  puts 'Creating Facilities...'
  facilities = Facility.create! [
    {facility: 'Wi-Fi'},
    {facility: 'Lift'},
    {facility: 'Balcony Rooms'}
  ]
rescue StandardError => exception
  puts exception.to_s.colorize(:red)
  puts exception.backtrace.find { |x| x =~ /seeds.rb/ }.to_s.colorize(:red)
ensure
  puts "Facilities: #{Facility.count}".colorize(:green)
end

begin
  puts 'Create Coaches...'
  coaches = Coach.create! [
    {
      title: 'The Aerocoope',
      description: 'The Aerocoope is headquartered in Lisbon Airport, was established in April 1975 by people from the former Pan Am, with the aim of providing support services to air companies. Initially (between 1975 and 1991), this meant airline cabin crew transportation from airport to hotel and vice versa, which still exists.
  Fruit quality of service, the Aerocoope managed to meet their customers garnering credibility with them and allowing new horizons were appearing. '
    }, {
      title: 'Yutong',
      description: 'Headquartered in Zhengzhou of central China’s Henan Province, Zhengzhou Yutong Group Co., Ltd. (hereinafter referred to as “Yutong Group”) is a large-scale industrial group mainly specialized in the bus business, and also covers some other strategic businesses such as construction machinery, automotive parts and components, real estate and so on. In 2016, the Yutong Group totally delivered 73,703 units of buses and construction machinery, up 4.4 percent year-on-year. The turnover of Yutong Group reached 45.2 billion yuan, a rise of 8.1 percent than the previous year, continuously ranked first in China’s bus industry in terms of the enterprise scale and sales performance.'
    }, {
      title: 'FIRSTCLASS'
    }
  ]
rescue StandardError => exception
  puts exception.to_s.colorize(:red)
  puts exception.backtrace.find { |x| x =~ /seeds.rb/ }.to_s.colorize(:red)
ensure
  puts "Coaches: #{Coach.count}".colorize(:green)
end

begin
  puts 'Create Hotels...'
  hotels = Hotel.create! [
    {
      title: 'Sunningdale Park',
      description: 'Set in 65 acres of gardens and woodland, Sunningdale Park offers boutique-style bedrooms, each with a flat-screen LCD TV and a work desk. All rooms have a modern bathroom and tea/coffee making facilities. Free on-site parking and free WiFi is available.'
    }, {
      title: 'Holiday Inn Express London Stansted',
      description: 'Just 5 minutes from Stansted Airport, this hotel offers breakfasts from 04:00, and a restaurant dinner menu. Central London is only a 45-minute train journey away. Holiday Inn Express Stansted Airport operates a half-hourly Shuttle Service to and from the airport terminal. The bus runs from Stansted Airport Coach Station Bay 21, and the return journey picks up from outside the hotels front doors.'
    }, {
      title: 'Milton Hilltop Hotel',
      description: 'Only 2.4 km from Carlisle, the Milton Hilltop Hotel boasts an on-site restaurant and 24-hour room service.Free WiFi and parking are provided. Bright and classic décor features in each room at Milton Hilltop Hotel, along with an en suite bathroom. The rooms also feature a TV with satellite channels, ironing facilities and a trouser press.'
    }, {
      title: 'BLOC Hotel Gatwick',
      description: 'Offering modern, comfortable accommodation, BLOC Hotel is located within the South Terminal of London’s Gatwick Airport. Free Wi-Fi is accessible throughout. Dependent on the provider, travellers can check-in their bags with their airline the night before their flight, arrive at BLOC Hotel Gatwick, and relax and enjoy the bespoke facilities. In the morning, it is a short walk from the hotel to Gatwick’s departure gates'
    }
  ]
rescue StandardError => exception
  puts exception.to_s.colorize(:red)
  puts exception.backtrace.find { |x| x =~ /seeds.rb/ }.to_s.colorize(:red)
ensure
  puts "Hotels: #{Hotel.count}".colorize(:green)
end

begin
  puts 'Creating Tours...'
  tours = Tour.create! [
    {
      title: 'Morocco Grand Tour',
      description: "<strong>Day 1: Meet you in the Casablanca airport and drive to Rabat (Riad Kalaa)</strong>
  <br>
  Upon arrival, we will greet you at the airport and drive to Casablanca and then to Rabat.  In Casablanca, you will visit the Hassan II Mosque, the largest outside of Mecca and experience the coastal `Cornish` seaside.  Afterwards, we will leave for Rabat, the capital of Morocco, where we will spend the night in a riad located in the middle of the medina of Rabat.
  <br><br>"
  }, {
      title: 'Iceland Discovery',
      description: 'Highlights
  <ul>
  <li><strong>Visit the impressive Golden Waterfall</strong></li>
  <li><strong>Soak in Myvatn Nature Bathsl</strong></li>
  <li><strong>Relax in Europe’s hottest thermal springl</strong></li>
  <li><strong>See the epic Skógafoss waterfalll</strong></li>
  <br>
  Start and end in Reykjavik! With the in-depth cultural tour Iceland Discovery, you have a 10 day tour package taking you through Reykjavik, Iceland and 7 other destinations in Iceland. Iceland Discovery is a small group tour that includes accommodation in a hotel as well as an expert guide, meals, transport.'
    }
  ]
rescue StandardError => exception
  puts exception.to_s.colorize(:red)
  puts exception.backtrace.find { |x| x =~ /seeds.rb/ }.to_s.colorize(:red)
ensure
  puts "Tours: #{Tour.count}".colorize(:green)
end

begin
  puts 'Creating Active tours...'
  active_tours = ActiveTour.create! [
    { tour: tours[0], start_date: Time.now, end_date: Time.now + 15.days },
    { tour: tours[1], start_date: Time.now, end_date: Time.now + 9.days },
    { tour: tours[0], start_date: 17.days.from_now, end_date: 17.days.from_now + 15.days },
    { tour: tours[1], start_date: 23.days.from_now, end_date: 23.days.from_now + 9.days }
  ]
rescue StandardError => exception
  puts exception.to_s.colorize(:red)
  puts exception.backtrace.find { |x| x =~ /seeds.rb/ }.to_s.colorize(:red)
ensure
  puts "Active tours: #{Tour.count}".colorize(:green)
end

begin
  puts 'Creating Seat Types...'
  seat_types = SeatType.create! [
    { name: 'Simple', price: 15, char: 'a', is_seat: true, color: '68b379' },
    { name: 'Business', price: 20, char: 'b', is_seat: true, color: 'a19eff' },
    { name: 'Last row', price: 10, char: 'c', is_seat: true, color: '9999ff' },
    { name: 'Lux', price: 30, char: 'l', is_seat: true, color: '00aaaa' },
    { name: 'WC', price: 0, char: 'w', is_seat: false, color: '949494' },
    { name: 'Empty', price: 0, char: '_', is_seat: false }
  ]
rescue StandardError => exception
  puts exception.to_s.colorize(:red)
  puts exception.backtrace.find { |x| x =~ /seeds.rb/ }.to_s.colorize(:red)
ensure
  puts "Seat Types: #{Seatplan.count}".colorize(:green)
end

begin
  puts 'Creating Seatplans...'
  seatplans = Seatplan.create! [
    {
      title: 'ABC',
      description: 'Seatplan with seats of type A, B and C',
      plan: "aa_aa\naa_aa\naa_aa\nbb_bb\nbb_ww\nbb_ww\nbb_bb\nbb_bb\nccccc"
    },
    {
      title: 'LBC',
      description: 'Seatplan with seats of type A, B and C',
      plan: "ll_ll\nll_ll\nll_ll\nbb_bb\nbb_bb\nbb_ww\nbb_ww\nbb_bb\nbb_bb\nccccc"
    }
  ]
rescue StandardError => exception
  puts exception.to_s.colorize(:red)
  puts exception.backtrace.find { |x| x =~ /seeds.rb/ }.to_s.colorize(:red)
ensure
  puts "Seatplans: #{Seatplan.count}".colorize(:green)
end

begin
  puts 'Creating Pickup Lists...'
  pickup_lists = PickupList.create!([Hash.new, Hash.new])
rescue StandardError => exception
  puts exception.to_s.colorize(:red)
  puts exception.backtrace.find { |x| x =~ /seeds.rb/ }.to_s.colorize(:red)
ensure
  puts "Pickup Lists: #{PickupList.count}".colorize(:green)
end

begin
  puts 'Creating Pickup Points...'
  pickup_points = PickupPoint.create! [
    {
      address: Faker::Address.street_address,
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude,
      pickup_list: pickup_lists[0]
    },
    {
      address: Faker::Address.street_address,
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude,
      pickup_list: pickup_lists[0]
    },
    {
      address: Faker::Address.street_address,
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude,
      pickup_list: pickup_lists[0]
    },
    {
      address: Faker::Address.street_address,
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude,
      pickup_list: pickup_lists[1]
    },
    {
      address: Faker::Address.street_address,
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude,
      pickup_list: pickup_lists[1]
    },
  ]
rescue StandardError => exception
  puts exception.to_s.colorize(:red)
  puts exception.backtrace.find { |x| x =~ /seeds.rb/ }.to_s.colorize(:red)
ensure
  puts "Pickup Points: #{PickupPoint.count}".colorize(:green)
end

begin
  puts 'Creating Tour coaches...'
  tour_coaches = TourCoach.create! [
    {
      coach: coaches[0],
      active_tour: active_tours[0],
      departure_date: Time.now,
      arrival_date: Time.now + 15.days,
      seatplan: seatplans[0],
      pickup_list: pickup_lists[1]
    },
    {
      coach: coaches[1],
      active_tour: active_tours[1],
      departure_date: Time.now,
      arrival_date: Time.now + 9.days,
      seatplan: seatplans[0],
      pickup_list: pickup_lists[1]
    },
    {
      coach: coaches[2],
      active_tour: active_tours[2],
      departure_date: 17.days.from_now,
      arrival_date: 17.days.from_now + 15.days,
      seatplan: seatplans[1],
      pickup_list: pickup_lists[0]
    },
    {
      coach: coaches[0],
      active_tour: active_tours[3],
      departure_date: 23.days.from_now,
      arrival_date: 23.days.from_now + 9.days,
      seatplan: seatplans[1],
      pickup_list: pickup_lists[0]
    }
  ]
rescue StandardError => exception
  puts exception.to_s.colorize(:red)
  puts exception.backtrace.find { |x| x =~ /seeds.rb/ }.to_s.colorize(:red)
ensure
  puts "Tour coaches: #{TourCoach.count}".colorize(:green)
end

begin
  puts 'Creating Tour hotels...'
  tour_hotels = TourHotel.create! [
    { hotel: hotels[0], active_tour: active_tours[0], board_basis: board_bases[0], start_date: Time.now, end_date: Time.now + 15.days },

    { hotel: hotels[0], active_tour: active_tours[2], board_basis: board_bases[0], start_date: 17.days.from_now, end_date: 17.days.from_now + 15.days },

    { hotel: hotels[1], active_tour: active_tours[1], board_basis: board_bases[0], start_date: Time.now, end_date: Time.now + 3.days },
    { hotel: hotels[2], active_tour: active_tours[1], board_basis: board_bases[0], start_date: Time.now + 4.days, end_date: Time.now + 5.days },
    { hotel: hotels[3], active_tour: active_tours[1], board_basis: board_bases[0], start_date: Time.now + 6.days, end_date: Time.now + 8.days },

    { hotel: hotels[1], active_tour: active_tours[3], board_basis: board_bases[0], start_date: 23.days.from_now, end_date: 23.days.from_now + 3.days },
    { hotel: hotels[2], active_tour: active_tours[3], board_basis: board_bases[0], start_date: 23.days.from_now + 4.days, end_date: 23.days.from_now + 5.days },
    { hotel: hotels[3], active_tour: active_tours[3], board_basis: board_bases[0], start_date: 23.days.from_now + 6.days, end_date: 23.days.from_now + 8.days }
  ]
rescue StandardError => exception
  puts exception.to_s.colorize(:red)
  puts exception.backtrace.find { |x| x =~ /seeds.rb/ }.to_s.colorize(:red)
ensure
  puts "Tour hotels: #{TourHotel.count}".colorize(:green)
end

begin
  puts 'Creating Hotel rooms...'
  tour_hotels[0].hotel_rooms.create! [
    { room_type: room_types[0], amount: 10, adult_buy: 200, adult_sell: 200, child_buy: 170, child_sell: 170, adult_supp: 10 },
    { room_type: room_types[1], amount: 15, adult_buy: 130, adult_sell: 130, child_buy: 120, child_sell: 120, infant_buy: 110, infant_sell: 110, senior_buy: 110, senior_sell: 110 },
    { room_type: room_types[2], amount: 15, adult_buy: 130, adult_sell: 130, child_buy: 120, child_sell: 120, infant_buy: 110, infant_sell: 110, senior_buy: 110, senior_sell: 110 },
    { room_type: room_types[3], amount: 5 },
  ]

  tour_hotels[1].hotel_rooms.create! [
    { room_type: room_types[0], amount: 10, adult_buy: 200, adult_sell: 200, child_buy: 170, child_sell: 170, adult_supp: 10 },
    { room_type: room_types[1], amount: 15, adult_buy: 130, adult_sell: 130, child_buy: 120, child_sell: 120, infant_buy: 110, infant_sell: 110, senior_buy: 110, senior_sell: 110 },
    { room_type: room_types[2], amount: 15, adult_buy: 130, adult_sell: 130, child_buy: 120, child_sell: 120, infant_buy: 110, infant_sell: 110, senior_buy: 110, senior_sell: 110 },
    { room_type: room_types[3], amount: 5, adult_buy: 100, adult_sell: 100, child_buy: 70, child_sell: 70, adult_supp: 5 },
  ]

  tour_hotels[2].hotel_rooms.create! [
    { room_type: room_types[0], amount: 55, adult_buy: 100, adult_sell: 100, child_buy: 70, child_sell: 70, adult_supp: 5 },
    { room_type: room_types[1], amount: 10, adult_buy: 200, adult_sell: 200, child_buy: 170, child_sell: 170, adult_supp: 10 },
    { room_type: room_types[3], amount: 25, adult_buy: 100, adult_sell: 100, child_buy: 70, child_sell: 70, adult_supp: 5 }
  ]

  tour_hotels[3].hotel_rooms.create! [
    { room_type: room_types[0], amount: 10, adult_buy: 200, adult_sell: 200, child_buy: 170, child_sell: 170, adult_supp: 10 },
    { room_type: room_types[1], amount: 30, adult_buy: 100, adult_sell: 100, child_buy: 70, child_sell: 70, adult_supp: 5 },
    { room_type: room_types[3], amount: 20, adult_buy: 100, adult_sell: 100, child_buy: 70, child_sell: 70, adult_supp: 5 }
  ]

  tour_hotels[4].hotel_rooms.create! [
    { room_type: room_types[0], amount: 10, adult_buy: 200, adult_sell: 200, child_buy: 170, child_sell: 170, adult_supp: 10 },
    { room_type: room_types[1], amount: 10, adult_buy: 200, adult_sell: 200, child_buy: 170, child_sell: 170, adult_supp: 10 },
    { room_type: room_types[3], amount: 10, adult_buy: 200, adult_sell: 200, child_buy: 170, child_sell: 170, adult_supp: 10 }
  ]

  tour_hotels[5].hotel_rooms.create! [
    { room_type: room_types[0], amount: 55, adult_buy: 100, adult_sell: 100, child_buy: 70, child_sell: 70, adult_supp: 5 },
    { room_type: room_types[1], amount: 10, adult_buy: 200, adult_sell: 200, child_buy: 170, child_sell: 170, adult_supp: 10 },
    { room_type: room_types[3], amount: 25, adult_buy: 100, adult_sell: 100, child_buy: 70, child_sell: 70, adult_supp: 5 }
  ]

  tour_hotels[6].hotel_rooms.create! [
    { room_type: room_types[0], amount: 10, adult_buy: 200, adult_sell: 200, child_buy: 170, child_sell: 170, adult_supp: 10 },
    { room_type: room_types[1], amount: 30, adult_buy: 100, adult_sell: 100, child_buy: 70, child_sell: 70, adult_supp: 5 },
    { room_type: room_types[3], amount: 20, adult_buy: 100, adult_sell: 100, child_buy: 70, child_sell: 70, adult_supp: 5 }
  ]

  tour_hotels[7].hotel_rooms.create! [
    { room_type: room_types[0], amount: 10, adult_buy: 200, adult_sell: 200, child_buy: 170, child_sell: 170, adult_supp: 10 },
    { room_type: room_types[1], amount: 10, adult_buy: 100, adult_sell: 100, child_buy: 70, child_sell: 70, adult_supp: 5 },
    { room_type: room_types[2], amount: 10, adult_buy: 100, adult_sell: 100, child_buy: 70, child_sell: 70, adult_supp: 5 }
  ]
rescue StandardError => exception
  puts exception.to_s.colorize(:red)
  puts exception.backtrace.find { |x| x =~ /seeds.rb/ }.to_s.colorize(:red)
ensure
  puts "Hotel rooms: #{HotelRoom.count}".colorize(:green)
end
