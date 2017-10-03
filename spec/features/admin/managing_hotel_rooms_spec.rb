require 'rails_helper'

describe 'Managing Hotel Rooms', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some Hotel Rooms' do
      before do
        @hotel_room = create :hotel_room, amount: 132
        create :hotel_room
        create :hotel_room
      end

      it 'can List all Tour hotels' do
        visit '/admin/hotel_room'
        expect(page).to have_content '3 hotel rooms'
      end

      it 'can Delete a Hotel room' do
        visit "/admin/hotel_room/#{@hotel_room.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/hotel_room'
        expect(page).to have_content '2 hotel rooms'
      end

      it 'can View the Hotel room' do
        visit "/admin/hotel_room/#{@hotel_room.id}"

        expect(page).to have_content 'Amount'
        expect(page).to have_content '132'
      end

      it 'can Edit the Hotel room' do
        visit "/admin/hotel_room/#{@hotel_room.id}/edit"
        expect(page).to have_content 'Tour hotel'
        expect(page).to have_content 'Amount'
        expect(page).to have_content 'Room type'
        expect(page).to have_content 'Adult'
        expect(page).to have_content 'Adult supp'
        expect(page).to have_content 'Child'
        expect(page).to have_content 'Child supp'
        expect(page).to have_content 'Infant'
        expect(page).to have_content 'Infant supp'

        fill_in 'hotel_room[amount]', with: '111'
        page.find(:css, '.btn-primary').click

        visit "/admin/hotel_room/#{@hotel_room.id}"
        expect(page).not_to have_content '132'
        expect(page).to have_content '111'
      end
    end
  end
end
