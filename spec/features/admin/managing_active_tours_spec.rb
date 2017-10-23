require 'rails_helper'

describe 'Managing Active Tours', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some active tours' do
      before do
        @active_tour = create :active_tour, start_date: Date.parse('2017-1-1')
        create :active_tour
        create :active_tour
      end

      it 'can List all active tours' do
        visit '/admin/active_tour'
        expect(page).to have_content '3 active tours'
      end

      it 'can Delete an active tour' do
        visit "/admin/active_tour/#{@active_tour.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/active_tour'
        expect(page).to have_content '2 active tours'
      end

      it 'can View the active tour' do
        visit "/admin/active_tour/#{@active_tour.id}"

        expect(page).to have_content 'Start date'
        expect(page).to have_content 'January 01, 2017'
      end

      it 'can Edit the active tour' do
        visit "/admin/active_tour/#{@active_tour.id}/edit"
        expect(page).to have_content 'Tour'
        expect(page).to have_content 'Start date'
        expect(page).to have_content 'End date'
        expect(page).to have_content 'Allow deposits'
        expect(page).to have_content 'Other costs'
        expect(page).to have_content 'Self drive'

        fill_in 'active_tour[start_date]', with: 'June 03, 2016'
        page.find(:css, '.btn-primary').click

        visit '/admin/active_tour'
        expect(page).not_to have_content 'January 01, 2017'
        expect(page).to have_content 'June 03, 2016'
      end
    end
  end
end
