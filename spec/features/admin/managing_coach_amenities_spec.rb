require 'rails_helper'

describe 'Managing Coach Amenities', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some Coach Amenities' do
      before do
        @coach_amenity = create :coach_amenity, name: 'Crazy one'
        create :coach_amenity, name: 'Some basis'
        create :coach_amenity, name: 'another one'
      end

      it 'can Add new one' do
        visit '/admin/coach_amenity/new'
        expect(page).to have_content 'Save'
      end

      it 'can List all Coach Amenities' do
        visit '/admin/coach_amenity'

        expect(page).to have_content 'Crazy one'
        expect(page).to have_content 'Some basis'
        expect(page).to have_content 'another one'
        expect(page).to have_content '3 coach amenities'
      end

      it 'can Delete an Coach amenity' do
        visit "/admin/coach_amenity/#{@coach_amenity.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/coach_amenity'

        expect(page).not_to have_content 'Crazy one'
        expect(page).to have_content 'Some basis'
        expect(page).to have_content 'another one'
        expect(page).to have_content '2 coach amenities'
      end

      it 'can View the Coach amenity' do
        visit "/admin/coach_amenity/#{@coach_amenity.id}"
        expect(page).to have_content 'Name'
        expect(page).to have_content 'Crazy one'
      end

      it 'can Edit the Coach amenity' do
        visit "/admin/coach_amenity/#{@coach_amenity.id}/edit"
        expect(page).to have_content 'Name'

        fill_in 'coach_amenity[name]', with: 'Wut face'
        page.find(:css, '.btn-primary').click

        visit '/admin/coach_amenity'
        expect(page).not_to have_content 'Crazy one'
        expect(page).to have_content 'Wut face'
      end
    end
  end
end
