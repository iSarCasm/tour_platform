require 'rails_helper'

describe 'Managing Amenities', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some Amenities' do
      before do
        @amenity = create :amenity, name: 'Crazy one'
        create :amenity, name: 'Some basis'
        create :amenity, name: 'another one'
      end

      it 'can Add new one' do
        visit '/admin/amenity/new'
        expect(page).to have_content 'Save'
      end

      it 'can List all Amenities' do
        visit '/admin/amenity'

        expect(page).to have_content 'Crazy one'
        expect(page).to have_content 'Some basis'
        expect(page).to have_content 'another one'
        expect(page).to have_content '3 amenities'
      end

      it 'can Delete an amenity' do
        visit "/admin/amenity/#{@amenity.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/amenity'

        expect(page).not_to have_content 'Crazy one'
        expect(page).to have_content 'Some basis'
        expect(page).to have_content 'another one'
        expect(page).to have_content '2 amenities'
      end

      it 'can View the amenity' do
        visit "/admin/amenity/#{@amenity.id}"
        expect(page).to have_content 'Name'
        expect(page).to have_content 'Crazy one'
      end

      it 'can Edit the amenity' do
        visit "/admin/amenity/#{@amenity.id}/edit"
        expect(page).to have_content 'Name'

        fill_in 'amenity[name]', with: 'Wut face'
        page.find(:css, '.btn-primary').click

        visit '/admin/amenity'
        expect(page).not_to have_content 'Crazy one'
        expect(page).to have_content 'Wut face'
      end
    end
  end
end
