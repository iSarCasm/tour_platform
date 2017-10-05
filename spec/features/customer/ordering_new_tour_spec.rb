require 'rails_helper'

describe 'Ordering new Tour', type: :feature, js: true do
  include Devise::Test::IntegrationHelpers

  before do
    tour = create :tour, title: 'UK Super Tour', description: 'Great Tour description'
    active_tour = create(
      :active_tour,
      tour: tour,
      start_date: Date.new(2017, 7, 14),
      end_date: Date.new(2017, 7, 28)
    )

    create(:seat_type, char: 'b', price: 10, is_seat: true)
    create(:seat_type, char: 'l', price: 20, is_seat: true)
    create(:seat_type, char: 'w', is_seat: false)
    seatplan = create(:seatplan, plan: "bb_bb\nll_ll\nww_ll\nbbbbb")
    tcoach = create(
      :tour_coach_with_pickup_list,
      active_tour: active_tour,
      seatplan: seatplan
    )

    plist = tcoach.pickup_list
    create(:pickup_point, pickup_list: plist, address: 'London UK 35')
    create(:pickup_point, pickup_list: plist, address: 'London UK 107')

    tour_hotel = create(:tour_hotel, active_tour: active_tour)
    create(
      :hotel_room,
      tour_hotel: tour_hotel,
      room_type: create(:room_type, room_type: 'Ultra-Big', pax: 6)
    )

    user = create :user
    sign_in user
  end

  it 'can order a new tour' do
    visit '/'
    expect(page).to have_content 'UK SUPER TOUR'
    click_link 'Start The Adventure'

    expect(page).to have_content 'UK Super Tour'
    expect(page).to have_content 'Great Tour description'
    expect(page).to have_content 'Book your tour now!'
    expect(page).to have_content 'UK Super Tour 14 July - 28 July'
    click_link 'UK Super Tour 14 July - 28 July'

    expect(page).to have_content 'Booking your tour'
    # Fill people
    fill_in 'tour_booking_adult', with: 2
    fill_in 'tour_booking_child', with: 1
    fill_in 'tour_booking_infant', with: 1
    fill_in 'tour_booking_senior', with: 2
    # Select Pickup Point
    click_link 'London UK 107'
    # Select Seats
    within('#seat-map') do
      page.find(:xpath, "//div[@role='checkbox'][text()='1']").click
      page.find(:xpath, "//div[@role='checkbox'][text()='2']").click
      page.find(:xpath, "//div[@role='checkbox'][text()='3']").click
      page.find(:xpath, "//div[@role='checkbox'][text()='7']").click
      page.find(:xpath, "//div[@role='checkbox'][text()='8']").click
      page.find(:xpath, "//div[@role='checkbox'][text()='11']").click
    end
    # Select Hotel Rooms
    select 'Ultra-Big, for 6 people'
    # Order
    click_button 'Order Now'

    expect(page).to have_content 'Successfuly ordered a tour!'
    expect(page).to have_content 'UK Super Tour'
    expect(page).to have_selector :link_or_button, 'Decline this booking'
  end
end
