require 'rails_helper'

describe 'Managing Hotels', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      permission = create :permission
      role = create :role
      create :role_permission, role: role, permission: permission
      user = create :user, base_role: :admin, role: role
      sign_in user
    end

    context 'with some Hotels' do
      before do
        @hotel = create :hotel, title: 'Grand Plaza'
        create :hotel, title: 'Budapesht'
        create :hotel, title: 'America'
      end

      it 'can List all hotels' do
        visit '/admin/hotel'
        expect(page).to have_content 'Grand Plaza'
        expect(page).to have_content 'Budapesht'
        expect(page).to have_content 'America'
      end

      it 'can Delete a hotel' do
        visit "/admin/hotel/#{@hotel.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/hotel'
        expect(page).not_to have_content 'Grand Plaza'
      end

      it 'can View the hotel' do
        visit "/admin/hotel/#{@hotel.id}"

        expect(page).to have_content 'Title'
        expect(page).to have_content 'Grand Plaza'
      end

      it 'can Edit the hotel' do
        visit "/admin/hotel/#{@hotel.id}/edit"
        expect(page).to have_content 'Title'
        expect(page).to have_content 'Description'
        expect(page).to have_content 'Address'
        expect(page).to have_content 'Phone number'
        expect(page).to have_content 'Fax number'
        expect(page).to have_content 'Email'
        expect(page).to have_content 'Website'
        expect(page).to have_content 'Contact name'
        expect(page).to have_content 'Emergency number'
        expect(page).to have_content 'Rating'

        fill_in 'hotel[title]', with: 'New Hotel Name'
        page.find(:css, '.btn-primary').click

        visit '/admin/hotel'
        expect(page).not_to have_content 'Grand Plaza'
        expect(page).to have_content 'New Hotel Name'
      end
    end
  end
end
