require 'rails_helper'

describe 'Managing Room Types', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some Room Types' do
      before do
        @room_type = create :room_type, room_type: 'Crazy one'
        create :room_type, room_type: 'Some basis'
        create :room_type, room_type: 'another one'
      end

      it 'can Add new one' do
        visit '/admin/room_type/new'
        expect(page).to have_content 'Save'
      end

      it 'can List all Room Types' do
        visit '/admin/room_type'

        expect(page).to have_content 'Crazy one'
        expect(page).to have_content 'Some basis'
        expect(page).to have_content 'another one'
        expect(page).to have_content '3 room types'
      end

      it 'can Delete an Room type' do
        visit "/admin/room_type/#{@room_type.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/room_type'

        expect(page).not_to have_content 'Crazy one'
        expect(page).to have_content 'Some basis'
        expect(page).to have_content 'another one'
        expect(page).to have_content '2 room types'
      end

      it 'can View the Room type' do
        visit "/admin/room_type/#{@room_type.id}"
        expect(page).to have_content 'Room type'
        expect(page).to have_content 'Crazy one'
      end

      it 'can Edit the Room type' do
        visit "/admin/room_type/#{@room_type.id}/edit"
        expect(page).to have_content 'Room type'
        expect(page).to have_content 'Pax'
        expect(page).to have_content 'Description'

        fill_in 'room_type[room_type]', with: 'Wut face'
        page.find(:css, '.btn-primary').click

        visit '/admin/room_type'
        expect(page).not_to have_content 'Crazy one'
        expect(page).to have_content 'Wut face'
      end
    end
  end
end
