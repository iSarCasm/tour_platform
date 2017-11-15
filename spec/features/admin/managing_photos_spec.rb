require 'rails_helper'

describe 'Managing Photos', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some Photos' do
      before do
        @photo = create :hotel_photo
        create :hotel_photo
        create :hotel_photo
      end

      it 'can Add new one' do
        visit '/admin/photo/new'
        expect(page).to have_content 'Save'
      end

      it 'can List all Photos' do
        visit '/admin/photo'
        expect(page).to have_content '3 photos'
      end

      it 'can Delete an Photo' do
        visit "/admin/photo/#{@photo.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/photo'
        expect(page).to have_content '2 photos'
      end

      it 'can View the Photo' do
        visit "/admin/photo/#{@photo.id}"
        expect(page).to have_content 'Photo'
      end

      it 'can Edit the Photo' do
        visit "/admin/photo/#{@photo.id}/edit"
        expect(page).to have_content 'Photo'
      end
    end
  end
end
