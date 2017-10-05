require 'rails_helper'

describe 'Managing Pickup points', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some Pickup points' do
      before do
        @pickup_point = create :pickup_point, address: 'Crazy one'
        create :pickup_point, address: 'Some basis'
        create :pickup_point, address: 'another one'
      end

      it 'can List all Pickup points' do
        visit '/admin/pickup_point'

        expect(page).to have_content 'Crazy one'
        expect(page).to have_content 'Some basis'
        expect(page).to have_content 'another one'
        expect(page).to have_content '3 pickup points'
      end

      it 'can Delete an Pickup point' do
        visit "/admin/pickup_point/#{@pickup_point.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/pickup_point'

        expect(page).not_to have_content 'Crazy one'
        expect(page).to have_content 'Some basis'
        expect(page).to have_content 'another one'
        expect(page).to have_content '2 pickup points'
      end

      it 'can View the Pickup point' do
        visit "/admin/pickup_point/#{@pickup_point.id}"
        expect(page).to have_content 'Pickup point'
        expect(page).to have_content 'Crazy one'
      end

      it 'can Edit the Pickup point' do
        visit "/admin/pickup_point/#{@pickup_point.id}/edit"
        expect(page).to have_content 'Pickup list'
        expect(page).to have_content 'Address'
        expect(page).to have_content 'Longitude'
        expect(page).to have_content 'Latitude'
        expect(page).to have_content 'Time to hub'
        expect(page).to have_content 'Time from hub'

        fill_in 'pickup_point[address]', with: 'Wut face'
        page.find(:css, '.btn-primary').click

        visit '/admin/pickup_point'
        expect(page).not_to have_content 'Crazy one'
        expect(page).to have_content 'Wut face'
      end
    end
  end
end
