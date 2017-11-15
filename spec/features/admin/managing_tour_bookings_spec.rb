require 'rails_helper'

describe 'Managing Tour Bookings', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some Tour Bookings' do
      before do
        @tour_booking = create :tour_booking, adult: 132
        create :tour_booking
        create :tour_booking
      end

      it 'can Add new one' do
        visit '/admin/tour_booking/new'
        expect(page).to have_content 'Save'
      end

      it 'can List all Tour Bookings' do
        visit '/admin/tour_booking'
        expect(page).to have_content '3 tour bookings'
      end

      it 'can Delete an Tour Booking' do
        visit "/admin/tour_booking/#{@tour_booking.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/tour_booking'
        expect(page).to have_content '2 tour bookings'
      end

      it 'can View the Tour Booking' do
        visit "/admin/tour_booking/#{@tour_booking.id}"

        expect(page).to have_content 'Adult'
        expect(page).to have_content '132'
      end

      it 'can Edit the Tour Booking' do
        visit "/admin/tour_booking/#{@tour_booking.id}/edit"
        expect(page).to have_content 'Active tour'
        expect(page).to have_content 'User'
        expect(page).to have_content 'Adult'
        expect(page).to have_content 'Child'
        expect(page).to have_content 'Infant'
        expect(page).to have_content 'Senior'

        fill_in 'tour_booking[adult]', with: '228'
        page.find(:css, '.btn-primary').click

        visit '/admin/tour_booking'
        expect(page).not_to have_content '132'
        expect(page).to have_content '228'
      end
    end
  end
end
