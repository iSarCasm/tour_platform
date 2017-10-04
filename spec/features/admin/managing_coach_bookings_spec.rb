require 'rails_helper'

describe 'Managing Coach Bookings', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some Coach Bookings' do
      before do
        @coach_booking = create :coach_booking
        create :coach_booking
        create :coach_booking
      end

      it 'can List all Coach Bookings' do
        visit '/admin/coach_booking'
        expect(page).to have_content '3 coach bookings'
      end

      it 'can Delete an Coach Booking' do
        visit "/admin/coach_booking/#{@coach_booking.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/coach_booking'
        expect(page).to have_content '2 coach bookings'
      end

      it 'can View the Coach Booking' do
        visit "/admin/coach_booking/#{@coach_booking.id}"
        expect(page).to have_content 'Tour coach'
        expect(page).to have_content 'Tour booking'
        expect(page).to have_content 'Seats'
        expect(page).to have_content 'Pickup point'
      end

      it 'can Edit the Coach Booking' do
        visit "/admin/coach_booking/#{@coach_booking.id}/edit"
        expect(page).to have_content 'Tour coach'
        expect(page).to have_content 'Tour booking'
        expect(page).to have_content 'Seats'
        expect(page).to have_content 'Pickup point'
      end
    end
  end
end
