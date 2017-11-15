require 'rails_helper'

describe 'Managing Facilities', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some Facilities' do
      before do
        @facility = create :facility, facility: 'Crazy one'
        create :facility, facility: 'Some basis'
        create :facility, facility: 'another one'
      end

      it 'can Add new one' do
        visit '/admin/facility/new'
        expect(page).to have_content 'Save'
      end

      it 'can List all Facilities' do
        visit '/admin/facility'

        expect(page).to have_content 'Crazy one'
        expect(page).to have_content 'Some basis'
        expect(page).to have_content 'another one'
        expect(page).to have_content '3 facilities'
      end

      it 'can Delete an Facility' do
        visit "/admin/facility/#{@facility.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/facility'

        expect(page).not_to have_content 'Crazy one'
        expect(page).to have_content 'Some basis'
        expect(page).to have_content 'another one'
        expect(page).to have_content '2 facilities'
      end

      it 'can View the Facility' do
        visit "/admin/facility/#{@facility.id}"
        expect(page).to have_content 'Facility'
        expect(page).to have_content 'Crazy one'
      end

      it 'can Edit the Facility' do
        visit "/admin/facility/#{@facility.id}/edit"
        expect(page).to have_content 'Facility'

        fill_in 'facility[facility]', with: 'Wut face'
        page.find(:css, '.btn-primary').click

        visit '/admin/facility'
        expect(page).not_to have_content 'Crazy one'
        expect(page).to have_content 'Wut face'
      end
    end
  end
end
