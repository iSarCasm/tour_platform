require 'rails_helper'

describe 'Managing Seat prices', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some Seat prices' do
      before do
        @seat_price = create :seat_price, price: 132.5
        create :seat_price, price: 128
        create :seat_price, price: 111
      end

      it 'can List all Seat prices' do
        visit '/admin/seat_price'

        expect(page).to have_content '132.5'
        expect(page).to have_content '128.0'
        expect(page).to have_content '111.0'
        expect(page).to have_content '3 seat prices'
      end

      it 'can Delete an Room type' do
        visit "/admin/seat_price/#{@seat_price.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/seat_price'

        expect(page).not_to have_content '132.5'
        expect(page).to have_content '128.0'
        expect(page).to have_content '111.0'
        expect(page).to have_content '2 seat prices'
      end

      it 'can View the Room type' do
        visit "/admin/seat_price/#{@seat_price.id}"
        expect(page).to have_content 'Room type'
        expect(page).to have_content '132.5'
      end

      it 'can Edit the Room type' do
        visit "/admin/seat_price/#{@seat_price.id}/edit"
        expect(page).to have_content 'Char'
        expect(page).to have_content 'Price'
        expect(page).to have_content 'Tour coach'

        fill_in 'seat_price[price]', with: 9999
        page.find(:css, '.btn-primary').click

        visit '/admin/seat_price'
        expect(page).not_to have_content '132.5'
        expect(page).to have_content '9999.0'
      end
    end
  end
end
