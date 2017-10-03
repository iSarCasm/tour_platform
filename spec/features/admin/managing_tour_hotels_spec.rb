require 'rails_helper'

describe 'Managing Tour Hotels', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some Tour  Hotels' do
      before do
        @tour_hotel = create :tour_hotel, hotel_theme: 'Christmas'
        create :tour_hotel
        create :tour_hotel
      end

      it 'can List all Tour hotels' do
        visit '/admin/tour_hotel'
        expect(page).to have_content '3 tour hotels'
      end

      it 'can Delete a Tour hotel' do
        visit "/admin/tour_hotel/#{@tour_hotel.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/tour_hotel'
        expect(page).to have_content '2 tour hotels'
      end

      it 'can View the Tour hotel' do
        visit "/admin/tour_hotel/#{@tour_hotel.id}"

        expect(page).to have_content 'Hotel theme'
        expect(page).to have_content 'Christmas'
      end

      it 'can Edit the Tour hotel' do
        visit "/admin/tour_hotel/#{@tour_hotel.id}/edit"
        expect(page).to have_content 'Hotel'
        expect(page).to have_content 'Active tour'
        expect(page).to have_content 'Start date'
        expect(page).to have_content 'End date'
        expect(page).to have_content 'Board basis'
        expect(page).to have_content 'Payment type'
        expect(page).to have_content 'Finalisation date'
        expect(page).to have_content 'Hotel theme'
        expect(page).to have_content 'Notes'

        fill_in 'tour_hotel[hotel_theme]', with: 'Halloween'
        page.find(:css, '.btn-primary').click

        visit "/admin/tour_hotel/#{@tour_hotel.id}"
        expect(page).not_to have_content 'Christmas'
        expect(page).to have_content 'Halloween'
      end
    end
  end
end
