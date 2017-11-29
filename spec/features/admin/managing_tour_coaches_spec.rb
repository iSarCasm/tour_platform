require 'rails_helper'

describe 'Managing Tour Coaches', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some Tour Coaches' do
      before do
        @tour_coach = create :tour_coach, driver_name: 'Jake Paul'
        create :tour_coach, driver_name: 'Ethan Klein'
        create :tour_coach, driver_name: 'Donald Trump'
      end

      it 'can Add new one' do
        visit '/admin/tour_coach/new'
        expect(page).to have_content 'Save'
      end

      it 'can List all coaches' do
        visit '/admin/tour_coach'
        expect(page).to have_content 'Jake Paul'
        expect(page).to have_content 'Ethan Klein'
        expect(page).to have_content 'Donald Trump'
      end

      it 'can Delete a coach' do
        visit "/admin/tour_coach/#{@tour_coach.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/tour_coach'
        expect(page).not_to have_content 'Jake Paul'
      end

      it 'can View the coach' do
        visit "/admin/tour_coach/#{@tour_coach.id}"

        expect(page).to have_content 'Driver name'
        expect(page).to have_content 'Jake Paul'
      end

      it 'can Edit the coach' do
        visit "/admin/tour_coach/#{@tour_coach.id}/edit"
        expect(page).to have_content 'Coach'
        expect(page).to have_content 'Active tour'
        expect(page).to have_content 'Departure date'
        expect(page).to have_content 'Arrival date'
        expect(page).to have_content 'Driver name'
        expect(page).to have_content 'Driver number'
        expect(page).to have_content 'Vehicle reg'
        expect(page).to have_content 'Notes'
        expect(page).to have_content 'Seatplan'
        expect(page).to have_content 'Rate'

        fill_in 'tour_coach[driver_name]', with: 'New Driver'
        page.find(:css, '.btn-primary').click

        visit '/admin/tour_coach'
        expect(page).not_to have_content 'Jake Paul'
        expect(page).to have_content 'New Driver'
      end
    end
  end
end
