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

ActiveRecord::Schema.define(version: 20170719131027) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_tours", force: :cascade do |t|
    t.bigint "tour_id"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_id"], name: "index_active_tours_on_tour_id"
  end

  create_table "coach_bookings", force: :cascade do |t|
    t.bigint "tour_coach_id"
    t.bigint "tour_booking_id"
    t.integer "seats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_booking_id"], name: "index_coach_bookings_on_tour_booking_id"
    t.index ["tour_coach_id"], name: "index_coach_bookings_on_tour_coach_id"
  end

  create_table "coaches", force: :cascade do |t|
    t.string "title"
    t.text "description"
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

  create_table "hotel_rooms", force: :cascade do |t|
    t.bigint "tour_hotel_id"
    t.integer "room_type"
    t.integer "number"
    t.integer "places"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_hotel_id"], name: "index_hotel_rooms_on_tour_hotel_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tour_bookings", force: :cascade do |t|
    t.bigint "active_tour_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active_tour_id"], name: "index_tour_bookings_on_active_tour_id"
    t.index ["user_id"], name: "index_tour_bookings_on_user_id"
  end

  create_table "tour_coaches", force: :cascade do |t|
    t.bigint "coach_id"
    t.bigint "active_tour_id"
    t.datetime "departure_date"
    t.datetime "arrival_date"
    t.integer "seats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active_tour_id"], name: "index_tour_coaches_on_active_tour_id"
    t.index ["coach_id"], name: "index_tour_coaches_on_coach_id"
  end

  create_table "tour_hotels", force: :cascade do |t|
    t.bigint "hotel_id"
    t.bigint "active_tour_id"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active_tour_id"], name: "index_tour_hotels_on_active_tour_id"
    t.index ["hotel_id"], name: "index_tour_hotels_on_hotel_id"
  end

  create_table "tours", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_tours", "tours"
  add_foreign_key "coach_bookings", "tour_bookings"
  add_foreign_key "coach_bookings", "tour_coaches"
  add_foreign_key "hotel_bookings", "hotel_rooms"
  add_foreign_key "hotel_bookings", "tour_bookings"
  add_foreign_key "hotel_rooms", "tour_hotels"
  add_foreign_key "tour_bookings", "active_tours"
  add_foreign_key "tour_bookings", "users"
  add_foreign_key "tour_coaches", "active_tours"
  add_foreign_key "tour_coaches", "coaches"
  add_foreign_key "tour_hotels", "active_tours"
  add_foreign_key "tour_hotels", "hotels"
end
