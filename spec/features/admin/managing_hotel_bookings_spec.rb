require 'rails_helper'

describe 'Managing Hotel Bookings', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some Hotel Bookings' do
      before do
        @hotel_booking = create :hotel_booking
        create :hotel_booking
        create :hotel_booking
      end

      it 'can Add new one' do
        visit '/admin/hotel_booking/new'
        expect(page).to have_content 'Save'
      end

      it 'can List all Hotel Bookings' do
        visit '/admin/hotel_booking'
        expect(page).to have_content '3 hotel bookings'
      end

      it 'can Delete an Hotel Booking' do
        visit "/admin/hotel_booking/#{@hotel_booking.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/hotel_booking'
        expect(page).to have_content '2 hotel bookings'
      end

      it 'can View the Hotel Booking' do
        visit "/admin/hotel_booking/#{@hotel_booking.id}"
        expect(page).to have_content 'Hotel room'
        expect(page).to have_content 'Tour booking'
      end

      it 'can Edit the Hotel Booking' do
        visit "/admin/hotel_booking/#{@hotel_booking.id}/edit"
        expect(page).to have_content 'Hotel room'
        expect(page).to have_content 'Tour booking'
      end
    end
  end
end
