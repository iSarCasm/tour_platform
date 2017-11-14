require 'rails_helper'

describe 'Managing Tours', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some tours' do
      before do
        @tour = create :tour, title: 'Tour one'
        create :tour, title: 'Tour two'
        create :tour, title: 'Tour three'
      end

      it 'can List all tours' do
        visit '/admin/tour'
        expect(page).to have_content 'Tour one'
        expect(page).to have_content 'Tour two'
        expect(page).to have_content 'Tour three'
      end

      it 'can Delete a tour' do
        visit "/admin/tour/#{@tour.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/tour'
        expect(page).not_to have_content 'Tour one'
      end

      it 'can View the tour' do
        visit "/admin/tour/#{@tour.id}"

        expect(page).to have_content 'Title'
        expect(page).to have_content 'Tour one'
      end

      it 'can Edit the tour' do
        visit "/admin/tour/#{@tour.id}/edit"
        expect(page).to have_content 'Title'
        expect(page).to have_content 'Description'
        expect(page).to have_content 'Tour type'
        expect(page).to have_content 'Country'
        expect(page).to have_content 'Categories'
        expect(page).to have_content 'Default allow deposits'
        expect(page).to have_content 'Default other costs'
        expect(page).to have_content 'Default self drive'
        expect(page).to have_content 'Default allow external agents'
        expect(page).to have_content 'Default insurance allowed'
        expect(page).to have_content 'Excursions'
        expect(page).to have_content 'Itinerary'
        expect(page).to have_content 'Important notes'
        expect(page).to have_content 'Tour memo'

        fill_in 'tour[title]', with: 'CRazY ToUr'
        page.find(:css, '.btn-primary').click

        visit '/admin/tour'
        expect(page).not_to have_content 'Tour one'
        expect(page).to have_content 'CRazY ToUr'
      end
    end
  end
end
