require 'rails_helper'

describe 'Managing Seat types', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some Seat types' do
      before do
        @seat_type = create :seat_type, name: 'Lux'
        create :seat_type, name: 'Crap'
        create :seat_type, name: 'WC'
      end

      it 'can List all Seat types' do
        visit '/admin/seat_type'

        expect(page).to have_content 'Lux'
        expect(page).to have_content 'Crap'
        expect(page).to have_content 'WC'
        expect(page).to have_content '3 seat types'
      end

      it 'can Delete an Seat type' do
        visit "/admin/seat_type/#{@seat_type.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/seat_type'

        expect(page).not_to have_content 'Lux'
        expect(page).to have_content 'Crap'
        expect(page).to have_content 'WC'
        expect(page).to have_content '2 seat types'
      end

      it 'can View the Seat type' do
        visit "/admin/seat_type/#{@seat_type.id}"
        expect(page).to have_content 'Name'
        expect(page).to have_content 'Lux'
      end

      it 'can Edit the Seat type' do
        visit "/admin/seat_type/#{@seat_type.id}/edit"
        expect(page).to have_content 'Name'
        expect(page).to have_content 'Price'
        expect(page).to have_content 'Char'
        expect(page).to have_content 'Is seat'
        expect(page).to have_content 'Color'

        fill_in 'seat_type[name]', with: 'Biz'
        page.find(:css, '.btn-primary').click

        visit '/admin/seat_type'
        expect(page).not_to have_content 'Lux'
        expect(page).to have_content 'Biz'
      end
    end
  end
end
