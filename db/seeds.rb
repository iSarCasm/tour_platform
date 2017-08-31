User.create!([
  {name: "Jack", email: "jack014@gmail.com", encrypted_password: "$2a$11$kp.wjXozW8AT8QHI5ozDU.UriU15yWC9Yeqj5DE6LtkRDIarKg8Hu", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, base_role: "customer", role_id: nil},
  {name: "Lisa", email: "lisalol@mail.ru", encrypted_password: "$2a$11$/Njh.DtuqWoe/VH1gVmqCOSrbQ0Z48TsyLH9qV2XmS0XKSuOo7kpa", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, base_role: "customer", role_id: nil},
  {name: "Anna", email: "annathebest@gmail.com", encrypted_password: "$2a$11$IfLnYdWozbKyOpYY7../J.RV9KC75lKcDYS0QBzPAogqC352ollyu", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, base_role: "customer", role_id: nil},
  {name: "Felix", email: "felix@pewdiepie.com", encrypted_password: "$2a$11$s10rxkWTCWBt0/3duo3n/eHHE24yQ3ZsGeqI7RQ7wntqikEjlGLUK", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, base_role: "customer", role_id: nil},
  {name: "admin", email: "admin@etours.com", encrypted_password: "$2a$11$xgsweYHMBX5IQFWk/Ic.dep/NQBu3g9wfI2Oo3zruu.0jCUd8cAda", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-08-15 18:29:05", last_sign_in_at: "2017-08-15 18:29:05", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", base_role: "admin", role_id: 2},
  {name: "admin", email: "superadmin@etours.com", encrypted_password: "$2a$11$bX8bf9oF/uVxD1kfTjAB..qNffXUQVmTMVyBbkKTHfwB4oHJbrMia", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-08-15 19:11:53", last_sign_in_at: "2017-08-15 19:11:53", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", base_role: "admin", role_id: 1}
])
ActiveTour.create!([
  {tour_id: 1, start_date: "2017-08-04", end_date: "2017-08-19", slug: "morocco-grand-tour-04-aug-2017-19-aug-2017"},
  {tour_id: 2, start_date: "2017-08-04", end_date: "2017-08-13", slug: "iceland-discovery-04-aug-2017-13-aug-2017"},
  {tour_id: 1, start_date: "2017-08-21", end_date: "2017-09-05", slug: "morocco-grand-tour-21-aug-2017-05-sep-2017"},
  {tour_id: 2, start_date: "2017-08-27", end_date: "2017-09-05", slug: "iceland-discovery-27-aug-2017-05-sep-2017"}
])
BoardBasis.create!([
  {title: "All Inclusive"},
  {title: "Full Board"},
  {title: "Full Board Plus"},
  {title: "Half Board"},
  {title: "Bed and Breakfast"},
  {title: "Self Catering"},
  {title: "Room Only"}
])
Coach.create!([
  {title: "Yutong", description: "Headquartered in Zhengzhou of central China’s Henan Province, Zhengzhou Yutong Group Co., Ltd. (hereinafter referred to as “Yutong Group”) is a large-scale industrial group mainly specialized in the bus business, and also covers some other strategic businesses such as construction machinery, automotive parts and components, real estate and so on. In 2016, the Yutong Group totally delivered 73,703 units of buses and construction machinery, up 4.4 percent year-on-year. The turnover of Yutong Group reached 45.2 billion yuan, a rise of 8.1 percent than the previous year, continuously ranked first in China’s bus industry in terms of the enterprise scale and sales performance.", address: nil, phone: nil, fax: nil, website: nil, email: nil, contact_name: nil, mobile_number: nil},
  {title: "FIRSTCLASS", description: nil, address: nil, phone: nil, fax: nil, website: nil, email: nil, contact_name: nil, mobile_number: nil},
  {title: "The Aerocoope", description: "The Aerocoope is headquartered in Lisbon Airport, was established in April 1975 by people from the former Pan Am, with the aim of providing support services to air companies. Initially (between 1975 and 1991), this meant airline cabin crew transportation from airport to hotel and vice versa, which still exists.\r\n  Fruit quality of service, the Aerocoope managed to meet their customers garnering credibility with them and allowing new horizons were appearing. ", address: "Londom, UK", phone: "+324824029", fax: "939490304", website: "aeroscoope.uk", email: "aeroscoope@yo.yo", contact_name: "Jake Smith", mobile_number: "123231323"}
])
CoachAmenity.create!([
  {name: "Wi-Fi"},
  {name: "Mini tables"},
  {name: "Air conditioner"}
])
CoachBooking.create!([
  {tour_coach_id: 3, tour_booking_id: 1, seats: nil},
  {tour_coach_id: 4, tour_booking_id: 5, seats: ["7_1", "7_2"]},
  {tour_coach_id: 2, tour_booking_id: 5, seats: ["7_1", "7_3"]},
  {tour_coach_id: 1, tour_booking_id: 2, seats: ["7_1", "7_3"]},
  {tour_coach_id: 1, tour_booking_id: 1, seats: ["7_4", "7_2"]},
  {tour_coach_id: 2, tour_booking_id: 10, seats: ["8_1", "9_2", "10_3", "10_4"]},
  {tour_coach_id: 2, tour_booking_id: 11, seats: ["3_1", "3_2"]},
  {tour_coach_id: 2, tour_booking_id: 12, seats: ["2_1", "2_2"]},
  {tour_coach_id: 4, tour_booking_id: 13, seats: ["3_1", "3_2"]},
  {tour_coach_id: 4, tour_booking_id: 14, seats: ["13", "14"]}
])
Facility.create!([
  {facility: "Wi-Fi"},
  {facility: "Lift"},
  {facility: "Balcony Rooms"}
])
Hotel.create!([
  {title: "Sunningdale Park", description: "Set in 65 acres of gardens and woodland, Sunningdale Park offers boutique-style bedrooms, each with a flat-screen LCD TV and a work desk. All rooms have a modern bathroom and tea/coffee making facilities. Free on-site parking and free WiFi is available.", address: nil, phone_number: nil, fax_number: nil, email: nil, website: nil, contact_name: nil, emergency_number: nil, rating: nil},
  {title: "Milton Hilltop Hotel", description: "Only 2.4 km from Carlisle, the Milton Hilltop Hotel boasts an on-site restaurant and 24-hour room service.Free WiFi and parking are provided. Bright and classic décor features in each room at Milton Hilltop Hotel, along with an en suite bathroom. The rooms also feature a TV with satellite channels, ironing facilities and a trouser press.", address: nil, phone_number: nil, fax_number: nil, email: nil, website: nil, contact_name: nil, emergency_number: nil, rating: nil},
  {title: "BLOC Hotel Gatwick", description: "Offering modern, comfortable accommodation, BLOC Hotel is located within the South Terminal of London’s Gatwick Airport. Free Wi-Fi is accessible throughout. Dependent on the provider, travellers can check-in their bags with their airline the night before their flight, arrive at BLOC Hotel Gatwick, and relax and enjoy the bespoke facilities. In the morning, it is a short walk from the hotel to Gatwick’s departure gates", address: "", phone_number: "", fax_number: "", email: "", website: "", contact_name: "", emergency_number: "", rating: nil},
  {title: "Holiday Inn Express London Stansted", description: "Just 5 minutes from Stansted Airport, this hotel offers breakfasts from 04:00, and a restaurant dinner menu. Central London is only a 45-minute train journey away. Holiday Inn Express Stansted Airport operates a half-hourly Shuttle Service to and from the airport terminal. The bus runs from Stansted Airport Coach Station Bay 21, and the return journey picks up from outside the hotels front doors.", address: "", phone_number: "", fax_number: "", email: "", website: "", contact_name: "", emergency_number: "", rating: nil}
])
HotelBooking.create!([
  {hotel_room_id: 4, tour_booking_id: 1},
  {hotel_room_id: 2, tour_booking_id: 2},
  {hotel_room_id: 8, tour_booking_id: 1},
  {hotel_room_id: 11, tour_booking_id: 4},
  {hotel_room_id: 14, tour_booking_id: 4},
  {hotel_room_id: 17, tour_booking_id: 4},
  {hotel_room_id: 18, tour_booking_id: 5},
  {hotel_room_id: 21, tour_booking_id: 5},
  {hotel_room_id: 24, tour_booking_id: 5},
  {hotel_room_id: 19, tour_booking_id: 6},
  {hotel_room_id: 23, tour_booking_id: 6},
  {hotel_room_id: 26, tour_booking_id: 6},
  {hotel_room_id: 11, tour_booking_id: 7},
  {hotel_room_id: 13, tour_booking_id: 7},
  {hotel_room_id: 17, tour_booking_id: 7},
  {hotel_room_id: 11, tour_booking_id: 8},
  {hotel_room_id: 13, tour_booking_id: 8},
  {hotel_room_id: 17, tour_booking_id: 8},
  {hotel_room_id: 11, tour_booking_id: 9},
  {hotel_room_id: 13, tour_booking_id: 9},
  {hotel_room_id: 17, tour_booking_id: 9},
  {hotel_room_id: 11, tour_booking_id: 10},
  {hotel_room_id: 13, tour_booking_id: 10},
  {hotel_room_id: 17, tour_booking_id: 10},
  {hotel_room_id: 11, tour_booking_id: 11},
  {hotel_room_id: 13, tour_booking_id: 11},
  {hotel_room_id: 17, tour_booking_id: 11},
  {hotel_room_id: 11, tour_booking_id: 12},
  {hotel_room_id: 13, tour_booking_id: 12},
  {hotel_room_id: 17, tour_booking_id: 12},
  {hotel_room_id: 19, tour_booking_id: 13},
  {hotel_room_id: 23, tour_booking_id: 13},
  {hotel_room_id: 26, tour_booking_id: 13},
  {hotel_room_id: 19, tour_booking_id: 14},
  {hotel_room_id: 23, tour_booking_id: 14},
  {hotel_room_id: 26, tour_booking_id: 14}
])
HotelFacility.create!([
  {hotel_id: 4, facility_id: 3},
  {hotel_id: 4, facility_id: 2}
])
HotelRoom.create!([
  {tour_hotel_id: 1, amount: 10, room_type_id: 1, adult: "200.0", adult_supp: "10.0", child: "170.0", child_supp: "0.0", infant: "0.0", infant_supp: "0.0", senior: "0.0", senior_supp: "0.0"},
  {tour_hotel_id: 1, amount: 15, room_type_id: 2, adult: "130.0", adult_supp: "0.0", child: "120.0", child_supp: "0.0", infant: "110.0", infant_supp: "0.0", senior: "110.0", senior_supp: "0.0"},
  {tour_hotel_id: 1, amount: 15, room_type_id: 3, adult: "130.0", adult_supp: "0.0", child: "120.0", child_supp: "0.0", infant: "110.0", infant_supp: "0.0", senior: "110.0", senior_supp: "0.0"},
  {tour_hotel_id: 1, amount: 5, room_type_id: 4, adult: "0.0", adult_supp: "0.0", child: "0.0", child_supp: "0.0", infant: "0.0", infant_supp: "0.0", senior: "0.0", senior_supp: "0.0"},
  {tour_hotel_id: 2, amount: 10, room_type_id: 1, adult: "200.0", adult_supp: "10.0", child: "170.0", child_supp: "0.0", infant: "0.0", infant_supp: "0.0", senior: "0.0", senior_supp: "0.0"},
  {tour_hotel_id: 2, amount: 15, room_type_id: 2, adult: "130.0", adult_supp: "0.0", child: "120.0", child_supp: "0.0", infant: "110.0", infant_supp: "0.0", senior: "110.0", senior_supp: "0.0"},
  {tour_hotel_id: 2, amount: 15, room_type_id: 3, adult: "130.0", adult_supp: "0.0", child: "120.0", child_supp: "0.0", infant: "110.0", infant_supp: "0.0", senior: "110.0", senior_supp: "0.0"},
  {tour_hotel_id: 2, amount: 5, room_type_id: 4, adult: "100.0", adult_supp: "5.0", child: "70.0", child_supp: "5.0", infant: "0.0", infant_supp: "0.0", senior: "0.0", senior_supp: "0.0"},
  {tour_hotel_id: 3, amount: 55, room_type_id: 1, adult: "100.0", adult_supp: "5.0", child: "70.0", child_supp: "5.0", infant: "0.0", infant_supp: "0.0", senior: "0.0", senior_supp: "0.0"},
  {tour_hotel_id: 3, amount: 10, room_type_id: 2, adult: "200.0", adult_supp: "10.0", child: "170.0", child_supp: "0.0", infant: "0.0", infant_supp: "0.0", senior: "0.0", senior_supp: "0.0"},
  {tour_hotel_id: 3, amount: 25, room_type_id: 4, adult: "100.0", adult_supp: "5.0", child: "70.0", child_supp: "5.0", infant: "0.0", infant_supp: "0.0", senior: "0.0", senior_supp: "0.0"},
  {tour_hotel_id: 4, amount: 10, room_type_id: 1, adult: "200.0", adult_supp: "10.0", child: "170.0", child_supp: "0.0", infant: "0.0", infant_supp: "0.0", senior: "0.0", senior_supp: "0.0"},
  {tour_hotel_id: 4, amount: 30, room_type_id: 2, adult: "100.0", adult_supp: "5.0", child: "70.0", child_supp: "5.0", infant: "0.0", infant_supp: "0.0", senior: "0.0", senior_supp: "0.0"},
  {tour_hotel_id: 4, amount: 20, room_type_id: 4, adult: "100.0", adult_supp: "5.0", child: "70.0", child_supp: "5.0", infant: "0.0", infant_supp: "0.0", senior: "0.0", senior_supp: "0.0"},
  {tour_hotel_id: 5, amount: 10, room_type_id: 1, adult: "200.0", adult_supp: "10.0", child: "170.0", child_supp: "0.0", infant: "0.0", infant_supp: "0.0", senior: "0.0", senior_supp: "0.0"},
  {tour_hotel_id: 5, amount: 10, room_type_id: 2, adult: "200.0", adult_supp: "10.0", child: "170.0", child_supp: "0.0", infant: "0.0", infant_supp: "0.0", senior: "0.0", senior_supp: "0.0"},
  {tour_hotel_id: 5, amount: 10, room_type_id: 4, adult: "200.0", adult_supp: "10.0", child: "170.0", child_supp: "0.0", infant: "0.0", infant_supp: "0.0", senior: "0.0", senior_supp: "0.0"},
  {tour_hotel_id: 6, amount: 55, room_type_id: 1, adult: "100.0", adult_supp: "5.0", child: "70.0", child_supp: "5.0", infant: "0.0", infant_supp: "0.0", senior: "0.0", senior_supp: "0.0"},
  {tour_hotel_id: 6, amount: 10, room_type_id: 2, adult: "200.0", adult_supp: "10.0", child: "170.0", child_supp: "0.0", infant: "0.0", infant_supp: "0.0", senior: "0.0", senior_supp: "0.0"},
  {tour_hotel_id: 6, amount: 25, room_type_id: 4, adult: "100.0", adult_supp: "5.0", child: "70.0", child_supp: "5.0", infant: "0.0", infant_supp: "0.0", senior: "0.0", senior_supp: "0.0"},
  {tour_hotel_id: 7, amount: 10, room_type_id: 1, adult: "200.0", adult_supp: "10.0", child: "170.0", child_supp: "0.0", infant: "0.0", infant_supp: "0.0", senior: "0.0", senior_supp: "0.0"},
  {tour_hotel_id: 7, amount: 30, room_type_id: 2, adult: "100.0", adult_supp: "5.0", child: "70.0", child_supp: "5.0", infant: "0.0", infant_supp: "0.0", senior: "0.0", senior_supp: "0.0"},
  {tour_hotel_id: 7, amount: 20, room_type_id: 4, adult: "100.0", adult_supp: "5.0", child: "70.0", child_supp: "5.0", infant: "0.0", infant_supp: "0.0", senior: "0.0", senior_supp: "0.0"},
  {tour_hotel_id: 8, amount: 10, room_type_id: 1, adult: "200.0", adult_supp: "10.0", child: "170.0", child_supp: "0.0", infant: "0.0", infant_supp: "0.0", senior: "0.0", senior_supp: "0.0"},
  {tour_hotel_id: 8, amount: 10, room_type_id: 2, adult: "100.0", adult_supp: "5.0", child: "70.0", child_supp: "5.0", infant: "0.0", infant_supp: "0.0", senior: "0.0", senior_supp: "0.0"},
  {tour_hotel_id: 8, amount: 10, room_type_id: 3, adult: "100.0", adult_supp: "5.0", child: "70.0", child_supp: "5.0", infant: "0.0", infant_supp: "0.0", senior: "0.0", senior_supp: "0.0"}
])
PaymentType.create!([
  {payment_type: "Credit invoice"},
  {payment_type: "Pre-Pay"}
])
Permission.create!([
  {subject_id: nil, action: "manage", subject_class: "everything"},
  {subject_id: nil, action: "manage", subject_class: "User"},
  {subject_id: nil, action: "add", subject_class: "User"},
  {subject_id: nil, action: "read", subject_class: "User"},
  {subject_id: nil, action: "edit", subject_class: "User"},
  {subject_id: nil, action: "remove", subject_class: "User"},
  {subject_id: nil, action: "export", subject_class: "User"},
  {subject_id: nil, action: "manage", subject_class: "ActiveTour"},
  {subject_id: nil, action: "add", subject_class: "ActiveTour"},
  {subject_id: nil, action: "read", subject_class: "ActiveTour"},
  {subject_id: nil, action: "edit", subject_class: "ActiveTour"},
  {subject_id: nil, action: "remove", subject_class: "ActiveTour"},
  {subject_id: nil, action: "export", subject_class: "ActiveTour"},
  {subject_id: nil, action: "manage", subject_class: "BoardBasis"},
  {subject_id: nil, action: "add", subject_class: "BoardBasis"},
  {subject_id: nil, action: "read", subject_class: "BoardBasis"},
  {subject_id: nil, action: "edit", subject_class: "BoardBasis"},
  {subject_id: nil, action: "remove", subject_class: "BoardBasis"},
  {subject_id: nil, action: "export", subject_class: "BoardBasis"},
  {subject_id: nil, action: "manage", subject_class: "Coach"},
  {subject_id: nil, action: "add", subject_class: "Coach"},
  {subject_id: nil, action: "read", subject_class: "Coach"},
  {subject_id: nil, action: "edit", subject_class: "Coach"},
  {subject_id: nil, action: "remove", subject_class: "Coach"},
  {subject_id: nil, action: "export", subject_class: "Coach"},
  {subject_id: nil, action: "manage", subject_class: "CoachAmenity"},
  {subject_id: nil, action: "add", subject_class: "CoachAmenity"},
  {subject_id: nil, action: "read", subject_class: "CoachAmenity"},
  {subject_id: nil, action: "edit", subject_class: "CoachAmenity"},
  {subject_id: nil, action: "remove", subject_class: "CoachAmenity"},
  {subject_id: nil, action: "export", subject_class: "CoachAmenity"},
  {subject_id: nil, action: "manage", subject_class: "CoachBooking"},
  {subject_id: nil, action: "add", subject_class: "CoachBooking"},
  {subject_id: nil, action: "read", subject_class: "CoachBooking"},
  {subject_id: nil, action: "edit", subject_class: "CoachBooking"},
  {subject_id: nil, action: "remove", subject_class: "CoachBooking"},
  {subject_id: nil, action: "export", subject_class: "CoachBooking"},
  {subject_id: nil, action: "manage", subject_class: "Facility"},
  {subject_id: nil, action: "add", subject_class: "Facility"},
  {subject_id: nil, action: "read", subject_class: "Facility"},
  {subject_id: nil, action: "edit", subject_class: "Facility"},
  {subject_id: nil, action: "remove", subject_class: "Facility"},
  {subject_id: nil, action: "export", subject_class: "Facility"},
  {subject_id: nil, action: "manage", subject_class: "Hotel"},
  {subject_id: nil, action: "add", subject_class: "Hotel"},
  {subject_id: nil, action: "read", subject_class: "Hotel"},
  {subject_id: nil, action: "edit", subject_class: "Hotel"},
  {subject_id: nil, action: "remove", subject_class: "Hotel"},
  {subject_id: nil, action: "export", subject_class: "Hotel"},
  {subject_id: nil, action: "manage", subject_class: "HotelBooking"},
  {subject_id: nil, action: "add", subject_class: "HotelBooking"},
  {subject_id: nil, action: "read", subject_class: "HotelBooking"},
  {subject_id: nil, action: "edit", subject_class: "HotelBooking"},
  {subject_id: nil, action: "remove", subject_class: "HotelBooking"},
  {subject_id: nil, action: "export", subject_class: "HotelBooking"},
  {subject_id: nil, action: "manage", subject_class: "HotelRoom"},
  {subject_id: nil, action: "add", subject_class: "HotelRoom"},
  {subject_id: nil, action: "read", subject_class: "HotelRoom"},
  {subject_id: nil, action: "edit", subject_class: "HotelRoom"},
  {subject_id: nil, action: "remove", subject_class: "HotelRoom"},
  {subject_id: nil, action: "export", subject_class: "HotelRoom"},
  {subject_id: nil, action: "manage", subject_class: "PaymentType"},
  {subject_id: nil, action: "add", subject_class: "PaymentType"},
  {subject_id: nil, action: "read", subject_class: "PaymentType"},
  {subject_id: nil, action: "edit", subject_class: "PaymentType"},
  {subject_id: nil, action: "remove", subject_class: "PaymentType"},
  {subject_id: nil, action: "export", subject_class: "PaymentType"},
  {subject_id: nil, action: "manage", subject_class: "Permission"},
  {subject_id: nil, action: "add", subject_class: "Permission"},
  {subject_id: nil, action: "read", subject_class: "Permission"},
  {subject_id: nil, action: "edit", subject_class: "Permission"},
  {subject_id: nil, action: "remove", subject_class: "Permission"},
  {subject_id: nil, action: "export", subject_class: "Permission"},
  {subject_id: nil, action: "manage", subject_class: "Photo"},
  {subject_id: nil, action: "add", subject_class: "Photo"},
  {subject_id: nil, action: "read", subject_class: "Photo"},
  {subject_id: nil, action: "edit", subject_class: "Photo"},
  {subject_id: nil, action: "remove", subject_class: "Photo"},
  {subject_id: nil, action: "export", subject_class: "Photo"},
  {subject_id: nil, action: "manage", subject_class: "PickupList"},
  {subject_id: nil, action: "add", subject_class: "PickupList"},
  {subject_id: nil, action: "read", subject_class: "PickupList"},
  {subject_id: nil, action: "edit", subject_class: "PickupList"},
  {subject_id: nil, action: "remove", subject_class: "PickupList"},
  {subject_id: nil, action: "export", subject_class: "PickupList"},
  {subject_id: nil, action: "manage", subject_class: "PickupPoint"},
  {subject_id: nil, action: "add", subject_class: "PickupPoint"},
  {subject_id: nil, action: "read", subject_class: "PickupPoint"},
  {subject_id: nil, action: "edit", subject_class: "PickupPoint"},
  {subject_id: nil, action: "remove", subject_class: "PickupPoint"},
  {subject_id: nil, action: "export", subject_class: "PickupPoint"},
  {subject_id: nil, action: "manage", subject_class: "Role"},
  {subject_id: nil, action: "add", subject_class: "Role"},
  {subject_id: nil, action: "read", subject_class: "Role"},
  {subject_id: nil, action: "edit", subject_class: "Role"},
  {subject_id: nil, action: "remove", subject_class: "Role"},
  {subject_id: nil, action: "export", subject_class: "Role"},
  {subject_id: nil, action: "manage", subject_class: "RoomType"},
  {subject_id: nil, action: "add", subject_class: "RoomType"},
  {subject_id: nil, action: "read", subject_class: "RoomType"},
  {subject_id: nil, action: "edit", subject_class: "RoomType"},
  {subject_id: nil, action: "remove", subject_class: "RoomType"},
  {subject_id: nil, action: "export", subject_class: "RoomType"},
  {subject_id: nil, action: "manage", subject_class: "SeatPrice"},
  {subject_id: nil, action: "add", subject_class: "SeatPrice"},
  {subject_id: nil, action: "read", subject_class: "SeatPrice"},
  {subject_id: nil, action: "edit", subject_class: "SeatPrice"},
  {subject_id: nil, action: "remove", subject_class: "SeatPrice"},
  {subject_id: nil, action: "export", subject_class: "SeatPrice"}
])
Photo.create!([
  {photo: "besthotelsites-1.jpg", photoable_id: 2, photoable_type: "Hotel"},
  {photo: "download.jpg", photoable_id: 2, photoable_type: "Hotel"},
  {photo: "Sarovar-Hotels-Ahmedabad.jpg", photoable_id: 2, photoable_type: "Hotel"}
])
PickupList.create!([
  {tour_coach_id: 4}
])
PickupPoint.create!([
  {pickup_list_id: 1, address: "London, United Kingdom", longitude: "-0.12775829999998223", latitude: "51.5073509", time_to_hub: "6", time_from_hub: "0"},
  {pickup_list_id: 1, address: "Arts Theatre Club, Frith Street, London, United Kingdom", longitude: "-0.1315941116394015", latitude: "51.51372719907578", time_to_hub: "5", time_from_hub: "1"},
  {pickup_list_id: 1, address: "Big Hill, London, United Kingdom", longitude: "-0.06124558629153398", latitude: "51.568002467391736", time_to_hub: "3", time_from_hub: "3"},
  {pickup_list_id: 1, address: "135 Bishopsgate, London, United Kingdom", longitude: "-0.07961390052491879", latitude: "51.518571668588955", time_to_hub: "1", time_from_hub: "5"}
])
Role.create!([
  {name: "Superadmin", description: nil},
  {name: "Admin", description: nil}
])
RolePermission.create!([
  {role_id: 1, permission_id: 1},
  {role_id: 2, permission_id: 86},
  {role_id: 2, permission_id: 44},
  {role_id: 2, permission_id: 26},
  {role_id: 2, permission_id: 2},
  {role_id: 2, permission_id: 14}
])
RoomType.create!([
  {room_type: "Single", pax: 1, description: "Single bed"},
  {room_type: "Double", pax: 2, description: "Double bed"},
  {room_type: "Twin", pax: 2, description: "Twin Room"},
  {room_type: "Triple", pax: 3, description: "Triple Room"}
])
SeatPrice.create!([
  {char: "p", price: "200.0", tour_coach_id: 2},
  {char: "b", price: "100.0", tour_coach_id: 2},
  {char: "p", price: "100.0", tour_coach_id: 4},
  {char: "b", price: "40.0", tour_coach_id: 4}
])
SeatType.create!([
  {name: "Empty", price: "0.0", char: "_", is_seat: false, color: nil},
  {name: "WC", price: "0.0", char: "w", is_seat: false, color: "7a7a7a"},
  {name: "Premier", price: "60.0", char: "p", is_seat: true, color: "3a78c3"},
  {name: "Business class", price: "40.0", char: "b", is_seat: true, color: "B9DEA0"}
])
Seatplan.create!([
  {title: "PAN 90", description: "The some made up vehicle plan", plan: "pp_pp\r\npp_pp\r\nbb_bb\r\nbb_bb\r\nbb_ww\r\nbb_ww\r\nbb___\r\nbb_bb\r\nbbbbb\r\nbbbbb"}
])
Tour.create!([
  {title: "Morocco Grand Tour", description: "<strong>Day 1: Meet you in the Casablanca airport and drive to Rabat (Riad Kalaa)</strong>\n  <br>\n  Upon arrival, we will greet you at the airport and drive to Casablanca and then to Rabat.  In Casablanca, you will visit the Hassan II Mosque, the largest outside of Mecca and experience the coastal `Cornish` seaside.  Afterwards, we will leave for Rabat, the capital of Morocco, where we will spend the night in a riad located in the middle of the medina of Rabat.\n  <br><br>\n  <strong>Day 2: Casablanca-Rabat_Chefchaouen (www.darechchchaouen.ma)-includes dinner and breakfast</strong>\n  <br>\n  After breakfast, we will visit the Hassan Tower in Rabat and then drive to Chefchaouen via the city of Knitra and the Rif Mountains, crossing via Wazzan and other Rif villages.  We will be in Chefchaouen by the early afternoon.\n  <br><br>\n  <strong>Day 3: Chefchaouen</strong>\n  <br>\n  An easy day in Chefchaoun to explore one of the most beautiful cities in Morocco, one of the stunning villages at the feet of the Rif mountains.  The\n  <br>\n  Chefchaouen medina had a Spanish-style square surrounded by many funky arts and crafts stores, roof-top restaurants and cafes where you will spend your night in a nice place to enjoy the breeze and the beauty of nature.\n  <br><br>\n  <strong>Day 4: Chefchaouen - Volubilis - Meknes - Fes</strong>\n  <br>\n  After your  breakfast in the riad, our exciting  journey will start towards Volubilis, crossing  via Wazan and other Rif villages. In Volubilis, we will visit the Roman ruins and learn about the archeological site and its Morrocan history.  After visiting the ruins, we will make our way to Meknes, a city with a 17th century heritage. We will stop here for lunch and hang out at the historical huge walls of the medina, Bab el Mansour and enjoy a visit to Moulay Ismail s shrine .\n  <br>\n  After the visit to Meknes  we will drive directly to Fes city, where you will spend the night.\n  <br><br>\n  <strong>Day 5: Fes Sightseeing</strong>\n  <br>\n  After breakfast in your riad, you will start exploring the oldest city in Morocco, walking in its alleys and small streets. Our visit starts by visiting the Royal Palace gate, the Jewish headquarters, the first Mellah ever built in Morocco, built during the 16th century. We will ensure that you visit all sites with a cultural and historical interest including the famous Al Qaraouine University, the oldest in the region, the Tanneries, the Attarine museum and Mulay Idriss mausoleum. After lunch, you will visit the tiles cooperative and then experience a wonderful panoramic view over the whole medina of Fes.\n  <br><br>\n  <strong>Day 6: Free morning in Fes and drive to Midelt in teh afternoon. ( Midelt is half way from Fes to Merzouga )</strong>\n  <br>\n  At mid-day, you will leave Fes travelling towards Ifran, a beautiful mountain village, referred to as `the Switzerland of Morocco` and then on to Midelt. During this journey you’ll experience glimpses of the Middle Atlas and Higher Atlas mountains. Stopping at Azrou, a Berber village in the middle of the famous cedar forest - the largest in Morocco – where you may well sight Barbary apes. After some time within the forest, your journey continues to Midelt along the magnificent hills and the Atlas mountains. In Midelt you will be accommodated in a luxurious hotel, Hotel Taddarte, dinner included\n  <br><br>\n  <strong>Day 7: Midelt - Ziz Valley - Erfoud - Merzouga. Camel ride and night in a camp.</strong>\n  <br>\n  After breakfast in your hotel, you will travel to Merzouga via Errachidia and Erfoud. You will be travelling through the fascinating Tiz Ntalghamt pass and the Ziz Gorge, taking in views of the High Atlas plateau. You’ll notice how the scenery changes to reveal hints of the desert as you approach the city of Errachidia, where you will have lunch and enjoy the Berber hospitality.  Afterwards, you will travel along the luxuriant Ziz Valley, stopping for panoramic views along the way to Erfoud and Rissani.  You will arrive at Merzouga in the afternoon. You’ll be welcomed with a glass of mint tea before you start your camel ride  to spend an overnight at the desert camp with Berber music and sand boarding.\n  <br><br>\n  <strong>Day 8: Merzouga - Ramlia village</strong>\n  <br>\n  The camel man will wake you up early in the morning to watch what well may be the best sunrise of your life. Afterwards, you’ll peacefully camel-trek back to your hotel, appreciating the unique beauty of the spectacular Erg Chebbi dunes – changing with the light as the day progresses. After breakfast and a shower, you’ll leave for Ramlia village, a remote village in the middle of desert. There you will meet the local people and experience the real rural Morocco, a very small oasis. You will have the chance to see the projects of Friends Of Nomads.\n  <br><br>\n  <strong>Day 9: Ramlia Village - Toudgha Gorges - Dades valley</strong>\n  <br>\n  After breakfast in the Aghbalou Ramlia guest house, we will drive off-road in the beautiful black desert crossing Berber oases of palm trees, mud houses, till we get to Alnif village, a place known for its fossil industry where we will have a stop for a drink, then continue our journey via the high Atlas mountains to see the stunning gorges of Todgha where springs of water runs between the rocks and enjoy the views of natural beauty. After the visit to the gorges, the trip continues through the magic mountains of the Dades Valley where we will end our day spending the night in a nice hotel located on the top of the mountain to enjoy an over view of the valley and the mountains.\n  <br><br>\n  <strong>Day 10: Dades valley -  Ouarzazette - Ait Ben Haddou kasbah - Marrakech</strong>\n  <br>\n  After breakfast in the hotel, you will travel through the Dades Valley towards Kalaa M'gouna and Ouarzazat. The route through Dades Valley is called, “the way of the thousand kasbahs” – providing numerous opportunities to take some of your best photographic shots of the trip in both the valley, famous for its roses and the cinema city of Ouarzazate.  We will  pass by Ait Ben Haddou Kasbah. the largest Kasbah in Morocco, built by T-hami El Glaoui, one of the last Berber chieftains.  During the beginning of the XXth Century, it used to be one of his stops during his long travels from the Sahara to Marrakech, now it is a UNESCO heritage site. After that, we will begin to cross the high Atlas mountains with many panoramic views and attractive Berber villages all along the way till marrakech\n  <br><br>\n  <strong>Day 11: Marrakech - Essaouira</strong>\n  <br>\n  The hustle and bustle of Marrakech quickly slips away as you travel to and enter into the peace and beauty that is Essaouira. This ancient citadel on the West Atlantic coast of Africa literally means “wall” in the Berber language, and you’ll soon discover why. Travelers from all over the world come here to experience the very special weather, and explore its diverse and unique history.\n  <br>\n  As we leave Marrakech, we drive through lush valleys filled with orange groves, ancient olive trees and working farms on the drive to the coast. After a short while, we arrive in Chichaoua, where we can take a short break for a coffee or snack at Cafe Afoulki.\n  <br>\n  Once you have had the chance to refuel a bit, we will continue on, soon coming upon our first signs of the Argan trees. These special trees are valued for their nutritive, cosmetic and numerous medicinal properties. The tree, a relic species from the Tertiary age, is extremely well adapted to drought and other environmentally difficult conditions of southwestern Morocco, and because they are now endangered, they are under the protection of UNESCO.\n  <br>\n  After all of your morning travels, you arrive in Essouira, where you have the chance to wander the ancient streets and can imagine what life existed here in the past. The streets have a genuinely Portuguese feel, after they renamed the city in the 16th century and used it as a port city of their own. Here you can dine on fish straight out of the sea at any number of local restaurants, and can even have a camel ride on the beach, if you want!\n  <br><br>\n  <strong>Day 12: Essaouira - Marrakech</strong>\n  <br>\n  After breakfast in your riad, depart back to  Marrakech. On our way - since this is the land of Argan culture - this is an opportunity to visit the women's co-operative of Argan oil where they extract the oil that is famous for its culinary, cosmetic and medicinal properties.  After several stops to take photographs, you will continue your travel to Marrakech and check-in to your riad.\n  <br>\n  After dinner you will enjoy walking within the famous square of Jemaa Elfna, entertained by magicians, story tellers, musicians and snake charmers. Overnight in a riad in the Medina.\n  <br><br>\n  <strong>Day 13: Marrakech Sightseeing</strong>\n  <br>\n  After breakfast in the riad , you can start exploring Marrakech  `the red city of Morocco`.  We will ensure that you see the most important sites of historical and cultural interest, including the Majorelle Gardens, the Koutoubia Tower, the Saadian tombs, the Bahia Palace. After lunch at a restaurant near the square, you will walk through the souks and view hundreds of handicrafts. In the afternoon, you will have some free time to wander by yourself through the other parts of the city .\n  <br><br>\n  <strong>Day 14: Free day in Marrakech</strong>\n  <br>\n  Today you will be on your own and if you would like to have a cooking class, Roughtours Team will help to arrange it for you.\n  <br><br>\n  <strong>Day 15: Transfer to the airport</strong>\n  <br>\n  We will drive you to the airport and provide assistance.", slug: "morocco-grand-tour"},
  {title: "Iceland Discovery", description: "Highlights\n  <ul>\n  <li><strong>Visit the impressive Golden Waterfall</strong></li>\n  <li><strong>Soak in Myvatn Nature Bathsl</strong></li>\n  <li><strong>Relax in Europe’s hottest thermal springl</strong></li>\n  <li><strong>See the epic Skógafoss waterfalll</strong></li>\n  <br>\n  Start and end in Reykjavik! With the in-depth cultural tour Iceland Discovery, you have a 10 day tour package taking you through Reykjavik, Iceland and 7 other destinations in Iceland. Iceland Discovery is a small group tour that includes accommodation in a hotel as well as an expert guide, meals, transport.", slug: "iceland-discovery"}
])
TourBooking.create!([
  {active_tour_id: 1, user_id: 3, adult: nil, child: nil, infant: nil, senior: nil},
  {active_tour_id: 1, user_id: 4, adult: nil, child: nil, infant: nil, senior: nil},
  {active_tour_id: 3, user_id: 5, adult: nil, child: nil, infant: nil, senior: nil},
  {active_tour_id: 2, user_id: 5, adult: nil, child: nil, infant: nil, senior: nil},
  {active_tour_id: 4, user_id: 6, adult: nil, child: nil, infant: nil, senior: nil},
  {active_tour_id: 4, user_id: 1, adult: nil, child: nil, infant: nil, senior: nil},
  {active_tour_id: 2, user_id: 1, adult: nil, child: nil, infant: nil, senior: nil},
  {active_tour_id: 2, user_id: 1, adult: nil, child: nil, infant: nil, senior: nil},
  {active_tour_id: 2, user_id: 1, adult: nil, child: nil, infant: nil, senior: nil},
  {active_tour_id: 2, user_id: 1, adult: nil, child: nil, infant: nil, senior: nil},
  {active_tour_id: 2, user_id: 1, adult: nil, child: nil, infant: nil, senior: nil},
  {active_tour_id: 2, user_id: 1, adult: nil, child: nil, infant: nil, senior: nil},
  {active_tour_id: 4, user_id: 1, adult: nil, child: nil, infant: nil, senior: nil},
  {active_tour_id: 4, user_id: 1, adult: nil, child: nil, infant: nil, senior: nil}
])
TourCoach.create!([
  {coach_id: 1, active_tour_id: 1, departure_date: "2017-08-04 11:13:16", arrival_date: "2017-08-19 11:13:16", driver_name: nil, driver_number: nil, notes: nil, seatplan_id: 1},
  {coach_id: 3, active_tour_id: 3, departure_date: "2017-08-21 11:13:16", arrival_date: "2017-09-05 11:13:16", driver_name: nil, driver_number: nil, notes: nil, seatplan_id: 1},
  {coach_id: 2, active_tour_id: 2, departure_date: "2017-08-04 11:13:00", arrival_date: "2017-08-13 11:13:00", driver_name: "", driver_number: "", notes: "", seatplan_id: 1},
  {coach_id: 1, active_tour_id: 4, departure_date: "2017-08-27 11:13:00", arrival_date: "2017-09-05 11:13:00", driver_name: "Karlos de Leguerre", driver_number: "94620573", notes: "Extreme Ride", seatplan_id: 1}
])
TourCoachAmenity.create!([
  {tour_coach_id: 4, coach_amenity_id: 1},
  {tour_coach_id: 4, coach_amenity_id: 3},
  {tour_coach_id: 4, coach_amenity_id: 2}
])
TourHotel.create!([
  {hotel_id: 1, active_tour_id: 1, start_date: "2017-08-04", end_date: "2017-08-19", board_basis_id: 1, payment_type_id: nil, finalisation_date: nil},
  {hotel_id: 1, active_tour_id: 3, start_date: "2017-08-21", end_date: "2017-09-05", board_basis_id: 1, payment_type_id: nil, finalisation_date: nil},
  {hotel_id: 2, active_tour_id: 2, start_date: "2017-08-04", end_date: "2017-08-07", board_basis_id: 1, payment_type_id: nil, finalisation_date: nil},
  {hotel_id: 3, active_tour_id: 2, start_date: "2017-08-08", end_date: "2017-08-09", board_basis_id: 1, payment_type_id: nil, finalisation_date: nil},
  {hotel_id: 4, active_tour_id: 2, start_date: "2017-08-10", end_date: "2017-08-12", board_basis_id: 1, payment_type_id: nil, finalisation_date: nil},
  {hotel_id: 2, active_tour_id: 4, start_date: "2017-08-27", end_date: "2017-08-30", board_basis_id: 1, payment_type_id: nil, finalisation_date: nil},
  {hotel_id: 3, active_tour_id: 4, start_date: "2017-08-31", end_date: "2017-09-01", board_basis_id: 1, payment_type_id: nil, finalisation_date: nil},
  {hotel_id: 4, active_tour_id: 4, start_date: "2017-09-02", end_date: "2017-09-04", board_basis_id: 1, payment_type_id: nil, finalisation_date: nil}
])
