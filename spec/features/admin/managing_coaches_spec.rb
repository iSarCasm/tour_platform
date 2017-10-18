require 'rails_helper'

describe 'Managing Coaches', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some coaches' do
      before do
        @coach = create :coach, title: 'Sample coach 1'
        create :coach, title: 'Very fast coach'
        create :coach, title: 'Train coach wtf?'
      end

      it 'can List all coaches' do
        visit '/admin/coach'
        expect(page).to have_content 'Sample coach 1'
        expect(page).to have_content 'Very fast coach'
        expect(page).to have_content 'Train coach wtf?'
      end

      it 'can Delete a coach' do
        visit "/admin/coach/#{@coach.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/coach'
        expect(page).not_to have_content 'Sample coach 1'
      end

      it 'can View the coach' do
        visit "/admin/coach/#{@coach.id}"

        expect(page).to have_content 'Title'
        expect(page).to have_content 'Sample coach 1'
      end

      it 'can Edit the coach' do
        visit "/admin/coach/#{@coach.id}/edit"
        expect(page).to have_content 'Title'
        expect(page).to have_content 'Description'
        expect(page).to have_content 'Address'
        expect(page).to have_content 'Phone'
        expect(page).to have_content 'Fax'
        expect(page).to have_content 'Website'
        expect(page).to have_content 'Email'
        expect(page).to have_content 'Contact name'
        expect(page).to have_content 'Mobile number'
        expect(page).to have_content 'Default Seatplan'
        expect(page).to have_content 'Default Seat Prices'
        expect(page).to have_content 'Notes'

        fill_in 'coach[title]', with: 'New Title of This COACH'
        page.find(:css, '.btn-primary').click

        visit '/admin/coach'
        expect(page).not_to have_content 'Sample coach 1'
        expect(page).to have_content 'New Title of This COACH'
      end
    end
  end
end
