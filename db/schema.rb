# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171201175517) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_tours", force: :cascade do |t|
    t.bigint "tour_id"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.boolean "allow_deposits"
    t.decimal "other_costs"
    t.boolean "self_drive"
    t.boolean "allow_external_agents"
    t.boolean "insurance_allowed"
    t.index ["slug"], name: "index_active_tours_on_slug", unique: true
    t.index ["tour_id"], name: "index_active_tours_on_tour_id"
  end

  create_table "admin_alerts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "content"
    t.boolean "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_admin_alerts_on_user_id"
  end

  create_table "amenities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "board_bases", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coach_amenities", force: :cascade do |t|
    t.bigint "coach_id"
    t.bigint "amenity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amenity_id"], name: "index_coach_amenities_on_amenity_id"
    t.index ["coach_id"], name: "index_coach_amenities_on_coach_id"
  end

  create_table "coach_bookings", force: :cascade do |t|
    t.bigint "tour_coach_id"
    t.bigint "tour_booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "seats"
    t.bigint "pickup_point_id"
    t.index ["pickup_point_id"], name: "index_coach_bookings_on_pickup_point_id"
    t.index ["tour_booking_id"], name: "index_coach_bookings_on_tour_booking_id"
    t.index ["tour_coach_id"], name: "index_coach_bookings_on_tour_coach_id"
  end

  create_table "coaches", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "address"
    t.string "phone_number"
    t.string "fax_number"
    t.text "website"
    t.string "email"
    t.string "contact_name"
    t.string "emergency_number"
    t.text "notes"
    t.bigint "seatplan_id"
    t.decimal "rating"
    t.index ["seatplan_id"], name: "index_coaches_on_seatplan_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "excursion_tours", force: :cascade do |t|
    t.bigint "excursion_id"
    t.bigint "tour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["excursion_id"], name: "index_excursion_tours_on_excursion_id"
    t.index ["tour_id"], name: "index_excursion_tours_on_tour_id"
  end

  create_table "excursions", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facilities", force: :cascade do |t|
    t.string "facility"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ferries", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "website"
    t.string "phone_number"
    t.string "contact_name"
    t.string "fax_number"
    t.string "emergency_number"
    t.string "email"
    t.decimal "rating"
    t.text "notes"
  end

  create_table "ferry_amenities", force: :cascade do |t|
    t.bigint "ferry_id"
    t.bigint "amenity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amenity_id"], name: "index_ferry_amenities_on_amenity_id"
    t.index ["ferry_id"], name: "index_ferry_amenities_on_ferry_id"
  end

  create_table "ferry_dates", force: :cascade do |t|
    t.bigint "ferry_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "active_tour_id"
    t.decimal "rate"
    t.integer "max_passengers"
    t.text "notes"
    t.index ["active_tour_id"], name: "index_ferry_dates_on_active_tour_id"
    t.index ["ferry_id"], name: "index_ferry_dates_on_ferry_id"
  end

  create_table "ferry_dates_amenities", force: :cascade do |t|
    t.bigint "ferry_date_id"
    t.bigint "amenity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amenity_id"], name: "index_ferry_dates_amenities_on_amenity_id"
    t.index ["ferry_date_id"], name: "index_ferry_dates_amenities_on_ferry_date_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "genders", force: :cascade do |t|
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hotel_bookings", force: :cascade do |t|
    t.bigint "hotel_room_id"
    t.bigint "tour_booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_room_id"], name: "index_hotel_bookings_on_hotel_room_id"
    t.index ["tour_booking_id"], name: "index_hotel_bookings_on_tour_booking_id"
  end

  create_table "hotel_facilities", force: :cascade do |t|
    t.bigint "hotel_id"
    t.bigint "facility_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facility_id"], name: "index_hotel_facilities_on_facility_id"
    t.index ["hotel_id"], name: "index_hotel_facilities_on_hotel_id"
  end

  create_table "hotel_rooms", force: :cascade do |t|
    t.bigint "tour_hotel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount"
    t.bigint "room_type_id"
    t.decimal "adult_buy", default: "0.0"
    t.decimal "adult_supp", default: "0.0"
    t.decimal "child_buy", default: "0.0"
    t.decimal "infant_buy", default: "0.0"
    t.decimal "senior_buy", default: "0.0"
    t.decimal "senior_supp", default: "0.0"
    t.bigint "hotel_id"
    t.decimal "adult_sell", default: "0.0"
    t.decimal "senior_sell", default: "0.0"
    t.decimal "child_sell", default: "0.0"
    t.decimal "infant_sell", default: "0.0"
    t.index ["hotel_id"], name: "index_hotel_rooms_on_hotel_id"
    t.index ["room_type_id"], name: "index_hotel_rooms_on_room_type_id"
    t.index ["tour_hotel_id"], name: "index_hotel_rooms_on_tour_hotel_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "phone_number"
    t.string "fax_number"
    t.string "email"
    t.string "website"
    t.string "contact_name"
    t.string "emergency_number"
    t.decimal "rating"
    t.bigint "board_basis_id"
    t.text "notes"
    t.bigint "payment_type_id"
    t.index ["board_basis_id"], name: "index_hotels_on_board_basis_id"
    t.index ["payment_type_id"], name: "index_hotels_on_payment_type_id"
  end

  create_table "notes", force: :cascade do |t|
    t.integer "noteable_id"
    t.string "noteable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "message"
    t.bigint "user_id"
    t.index ["noteable_type", "noteable_id"], name: "index_notes_on_noteable_type_and_noteable_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "payment_types", force: :cascade do |t|
    t.string "payment_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.integer "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "action"
    t.integer "subject_class"
  end

  create_table "photos", force: :cascade do |t|
    t.string "photo"
    t.integer "photoable_id"
    t.string "photoable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photoable_type", "photoable_id"], name: "index_photos_on_photoable_type_and_photoable_id"
  end

  create_table "pickup_lists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pickup_points", force: :cascade do |t|
    t.bigint "pickup_list_id"
    t.string "address"
    t.decimal "longitude"
    t.decimal "latitude"
    t.string "time_to_hub"
    t.string "time_from_hub"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pickup_list_id"], name: "index_pickup_points_on_pickup_list_id"
  end

  create_table "role_permissions", force: :cascade do |t|
    t.bigint "role_id"
    t.bigint "permission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_id"], name: "index_role_permissions_on_permission_id"
    t.index ["role_id"], name: "index_role_permissions_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "room_types", force: :cascade do |t|
    t.string "room_type"
    t.integer "pax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
  end

  create_table "seat_prices", force: :cascade do |t|
    t.string "char"
    t.decimal "price"
    t.bigint "tour_coach_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "coach_id"
    t.index ["coach_id"], name: "index_seat_prices_on_coach_id"
    t.index ["tour_coach_id"], name: "index_seat_prices_on_tour_coach_id"
  end

  create_table "seat_types", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "char"
    t.boolean "is_seat"
    t.string "color"
    t.index ["char"], name: "index_seat_types_on_char", unique: true
    t.index ["name"], name: "index_seat_types_on_name", unique: true
  end

  create_table "seatplans", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "plan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ticket_operators", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "address"
    t.text "description"
    t.string "website"
    t.string "phone_number"
    t.string "buyer_name"
    t.string "fax_number"
    t.string "buyer_number"
    t.string "email"
    t.decimal "rating"
    t.integer "stock"
    t.decimal "adult_buy"
    t.decimal "adult_sell"
    t.decimal "senior_buy"
    t.decimal "senior_sell"
    t.decimal "child_buy"
    t.decimal "child_sell"
    t.decimal "infant_buy"
    t.decimal "infant_sell"
  end

  create_table "tour_amenities", force: :cascade do |t|
    t.bigint "tour_coach_id"
    t.bigint "amenity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amenity_id"], name: "index_tour_amenities_on_amenity_id"
    t.index ["tour_coach_id"], name: "index_tour_amenities_on_tour_coach_id"
  end

  create_table "tour_bookings", force: :cascade do |t|
    t.bigint "active_tour_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "adult"
    t.integer "child"
    t.integer "infant"
    t.integer "senior"
    t.index ["active_tour_id"], name: "index_tour_bookings_on_active_tour_id"
    t.index ["user_id"], name: "index_tour_bookings_on_user_id"
  end

  create_table "tour_categories", force: :cascade do |t|
    t.bigint "tour_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_tour_categories_on_category_id"
    t.index ["tour_id"], name: "index_tour_categories_on_tour_id"
  end

  create_table "tour_coaches", force: :cascade do |t|
    t.bigint "coach_id"
    t.bigint "active_tour_id"
    t.datetime "departure_date"
    t.datetime "arrival_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "driver_name"
    t.string "driver_number"
    t.text "notes"
    t.bigint "seatplan_id"
    t.decimal "rate"
    t.string "vehicle_reg"
    t.bigint "pickup_list_id"
    t.index ["active_tour_id"], name: "index_tour_coaches_on_active_tour_id"
    t.index ["coach_id"], name: "index_tour_coaches_on_coach_id"
    t.index ["pickup_list_id"], name: "index_tour_coaches_on_pickup_list_id"
    t.index ["seatplan_id"], name: "index_tour_coaches_on_seatplan_id"
  end

  create_table "tour_excursions", force: :cascade do |t|
    t.bigint "ticket_operator_id"
    t.bigint "active_tour_id"
    t.datetime "ticket_date"
    t.text "notes"
    t.integer "stock"
    t.decimal "adult_buy"
    t.decimal "adult_sell"
    t.decimal "senior_buy"
    t.decimal "senior_sell"
    t.decimal "child_buy"
    t.decimal "child_sell"
    t.decimal "infant_buy"
    t.decimal "infant_sell"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "excursion_id"
    t.index ["active_tour_id"], name: "index_tour_excursions_on_active_tour_id"
    t.index ["excursion_id"], name: "index_tour_excursions_on_excursion_id"
    t.index ["ticket_operator_id"], name: "index_tour_excursions_on_ticket_operator_id"
  end

  create_table "tour_hotels", force: :cascade do |t|
    t.bigint "hotel_id"
    t.bigint "active_tour_id"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "board_basis_id"
    t.bigint "payment_type_id"
    t.datetime "finalisation_date"
    t.string "hotel_theme"
    t.text "notes"
    t.index ["active_tour_id"], name: "index_tour_hotels_on_active_tour_id"
    t.index ["board_basis_id"], name: "index_tour_hotels_on_board_basis_id"
    t.index ["hotel_id"], name: "index_tour_hotels_on_hotel_id"
    t.index ["payment_type_id"], name: "index_tour_hotels_on_payment_type_id"
  end

  create_table "tour_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tours", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.bigint "tour_type_id"
    t.bigint "country_id"
    t.text "itinerary"
    t.text "important_notes"
    t.text "tour_memo"
    t.decimal "other_costs"
    t.boolean "self_drive"
    t.boolean "allow_deposits"
    t.boolean "allow_external_agents"
    t.boolean "insurance_allowed"
    t.index ["country_id"], name: "index_tours_on_country_id"
    t.index ["slug"], name: "index_tours_on_slug", unique: true
    t.index ["tour_type_id"], name: "index_tours_on_tour_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "base_role", default: 0
    t.bigint "role_id"
    t.string "title"
    t.string "address"
    t.string "postcode"
    t.string "passport_name"
    t.string "passport_no"
    t.date "date_of_birth"
    t.string "phone_mobile"
    t.string "phone_landline"
    t.string "phone_evening"
    t.string "kin_name"
    t.string "kin_phone"
    t.boolean "travel_club"
    t.string "member_no"
    t.string "first_name"
    t.string "last_name"
    t.boolean "marketing_email"
    t.boolean "marketing_sms"
    t.boolean "marketing_phone"
    t.boolean "marketing_postal"
    t.date "passport_expiry"
    t.bigint "gender_id"
    t.boolean "may_expand_more_with_full_contact"
    t.boolean "client_unsuitable_for_travel"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["gender_id"], name: "index_users_on_gender_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id"
    t.string "foreign_key_name", null: false
    t.integer "foreign_key_id"
    t.index ["foreign_key_name", "foreign_key_id"], name: "index_version_associations_on_foreign_key"
    t.index ["version_id"], name: "index_version_associations_on_version_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.text "object_changes"
    t.integer "transaction_id"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
    t.index ["transaction_id"], name: "index_versions_on_transaction_id"
  end

  add_foreign_key "active_tours", "tours"
  add_foreign_key "admin_alerts", "users"
  add_foreign_key "coach_amenities", "amenities"
  add_foreign_key "coach_amenities", "coaches"
  add_foreign_key "coach_bookings", "pickup_points"
  add_foreign_key "coach_bookings", "tour_bookings"
  add_foreign_key "coach_bookings", "tour_coaches"
  add_foreign_key "coaches", "seatplans"
  add_foreign_key "excursion_tours", "excursions"
  add_foreign_key "excursion_tours", "tours"
  add_foreign_key "ferry_amenities", "amenities"
  add_foreign_key "ferry_amenities", "ferries"
  add_foreign_key "ferry_dates", "active_tours"
  add_foreign_key "ferry_dates", "ferries"
  add_foreign_key "ferry_dates_amenities", "amenities"
  add_foreign_key "ferry_dates_amenities", "ferry_dates"
  add_foreign_key "hotel_bookings", "hotel_rooms"
  add_foreign_key "hotel_bookings", "tour_bookings"
  add_foreign_key "hotel_facilities", "facilities"
  add_foreign_key "hotel_facilities", "hotels"
  add_foreign_key "hotel_rooms", "hotels"
  add_foreign_key "hotel_rooms", "tour_hotels"
  add_foreign_key "hotels", "board_bases"
  add_foreign_key "hotels", "payment_types"
  add_foreign_key "pickup_points", "pickup_lists"
  add_foreign_key "role_permissions", "permissions"
  add_foreign_key "role_permissions", "roles"
  add_foreign_key "seat_prices", "coaches"
  add_foreign_key "seat_prices", "tour_coaches"
  add_foreign_key "tour_amenities", "amenities"
  add_foreign_key "tour_amenities", "tour_coaches"
  add_foreign_key "tour_bookings", "active_tours"
  add_foreign_key "tour_bookings", "users"
  add_foreign_key "tour_categories", "categories"
  add_foreign_key "tour_categories", "tours"
  add_foreign_key "tour_coaches", "active_tours"
  add_foreign_key "tour_coaches", "coaches"
  add_foreign_key "tour_coaches", "seatplans"
  add_foreign_key "tour_excursions", "active_tours"
  add_foreign_key "tour_excursions", "excursions"
  add_foreign_key "tour_excursions", "ticket_operators"
  add_foreign_key "tour_hotels", "active_tours"
  add_foreign_key "tour_hotels", "board_bases"
  add_foreign_key "tour_hotels", "hotels"
  add_foreign_key "tour_hotels", "payment_types"
  add_foreign_key "tours", "countries"
  add_foreign_key "tours", "tour_types"
  add_foreign_key "users", "genders"
  add_foreign_key "users", "roles"
end
