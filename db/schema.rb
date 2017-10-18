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

ActiveRecord::Schema.define(version: 20171018131709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_tours", force: :cascade do |t|
    t.bigint "tour_id"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
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

  create_table "board_bases", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coach_amenities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "phone"
    t.string "fax"
    t.text "website"
    t.string "email"
    t.string "contact_name"
    t.string "mobile_number"
    t.text "notes"
    t.bigint "seatplan_id"
    t.index ["seatplan_id"], name: "index_coaches_on_seatplan_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facilities", force: :cascade do |t|
    t.string "facility"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.decimal "adult", default: "0.0"
    t.decimal "adult_supp", default: "0.0"
    t.decimal "child", default: "0.0"
    t.decimal "child_supp", default: "0.0"
    t.decimal "infant", default: "0.0"
    t.decimal "infant_supp", default: "0.0"
    t.decimal "senior", default: "0.0"
    t.decimal "senior_supp", default: "0.0"
    t.bigint "hotel_id"
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
    t.bigint "tour_coach_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_coach_id"], name: "index_pickup_lists_on_tour_coach_id"
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

  create_table "tour_coach_amenities", force: :cascade do |t|
    t.bigint "tour_coach_id"
    t.bigint "coach_amenity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_amenity_id"], name: "index_tour_coach_amenities_on_coach_amenity_id"
    t.index ["tour_coach_id"], name: "index_tour_coach_amenities_on_tour_coach_id"
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
    t.index ["active_tour_id"], name: "index_tour_coaches_on_active_tour_id"
    t.index ["coach_id"], name: "index_tour_coaches_on_coach_id"
    t.index ["seatplan_id"], name: "index_tour_coaches_on_seatplan_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
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
  add_foreign_key "coach_bookings", "pickup_points"
  add_foreign_key "coach_bookings", "tour_bookings"
  add_foreign_key "coach_bookings", "tour_coaches"
  add_foreign_key "coaches", "seatplans"
  add_foreign_key "hotel_bookings", "hotel_rooms"
  add_foreign_key "hotel_bookings", "tour_bookings"
  add_foreign_key "hotel_facilities", "facilities"
  add_foreign_key "hotel_facilities", "hotels"
  add_foreign_key "hotel_rooms", "hotels"
  add_foreign_key "hotel_rooms", "tour_hotels"
  add_foreign_key "hotels", "board_bases"
  add_foreign_key "hotels", "payment_types"
  add_foreign_key "pickup_lists", "tour_coaches"
  add_foreign_key "pickup_points", "pickup_lists"
  add_foreign_key "role_permissions", "permissions"
  add_foreign_key "role_permissions", "roles"
  add_foreign_key "seat_prices", "coaches"
  add_foreign_key "seat_prices", "tour_coaches"
  add_foreign_key "tour_bookings", "active_tours"
  add_foreign_key "tour_bookings", "users"
  add_foreign_key "tour_coach_amenities", "coach_amenities"
  add_foreign_key "tour_coach_amenities", "tour_coaches"
  add_foreign_key "tour_coaches", "active_tours"
  add_foreign_key "tour_coaches", "coaches"
  add_foreign_key "tour_coaches", "seatplans"
  add_foreign_key "tour_hotels", "active_tours"
  add_foreign_key "tour_hotels", "board_bases"
  add_foreign_key "tour_hotels", "hotels"
  add_foreign_key "tour_hotels", "payment_types"
  add_foreign_key "tours", "countries"
  add_foreign_key "tours", "tour_types"
  add_foreign_key "users", "roles"
end
