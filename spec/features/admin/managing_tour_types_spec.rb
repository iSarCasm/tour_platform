require 'rails_helper'

describe 'Managing Tour Types', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some Tour Types' do
      before do
        @tour_type = create :tour_type, name: 'Crazy one'
        create :tour_type, name: 'Some basis'
        create :tour_type, name: 'another one'
      end

      it 'can Add new one' do
        visit '/admin/tour_type/new'
        expect(page).to have_content 'Save'
      end

      it 'can List all Tour Types' do
        visit '/admin/tour_type'

        expect(page).to have_content 'Crazy one'
        expect(page).to have_content 'Some basis'
        expect(page).to have_content 'another one'
        expect(page).to have_content '3 tour types'
      end

      it 'can Delete an Tour Type' do
        visit "/admin/tour_type/#{@tour_type.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/tour_type'

        expect(page).not_to have_content 'Crazy one'
        expect(page).to have_content 'Some basis'
        expect(page).to have_content 'another one'
        expect(page).to have_content '2 tour types'
      end

      it 'can View the Tour Type' do
        visit "/admin/tour_type/#{@tour_type.id}"
        expect(page).to have_content 'Name'
        expect(page).to have_content 'Crazy one'
      end

      it 'can Edit the Tour Type' do
        visit "/admin/tour_type/#{@tour_type.id}/edit"
        expect(page).to have_content 'Name'

        fill_in 'tour_type[name]', with: 'Wut face'
        page.find(:css, '.btn-primary').click

        visit '/admin/tour_type'
        expect(page).not_to have_content 'Crazy one'
        expect(page).to have_content 'Wut face'
      end
    end
  end
end
