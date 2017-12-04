require 'rails_helper'

describe 'Managing Ferry Dates', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some ferry dates' do
      before do
        @ferry = create :ferry_date, rate: '44444'
        create :ferry_date, rate: '55555'
        create :ferry_date, rate: '66666'
      end

      it 'can Add new one' do
        visit '/admin/ferry_date/new'
        expect(page).to have_content 'Save'
      end

      it 'can List all ferry dates' do
        visit '/admin/ferry_date'
        expect(page).to have_content '44444'
        expect(page).to have_content '55555'
        expect(page).to have_content '66666'
      end

      it 'can Delete a ferry date' do
        visit "/admin/ferry_date/#{@ferry.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/ferry_date'
        expect(page).not_to have_content '44444'
      end

      it 'can View the ferry date' do
        visit "/admin/ferry_date/#{@ferry.id}"

        expect(page).to have_content 'Notes'
        expect(page).to have_content '44444'
      end

      it 'can Edit the ferry date' do
        visit "/admin/ferry_date/#{@ferry.id}/edit"
        expect(page).to have_content 'Ferry'
        expect(page).to have_content 'Active tour'
        expect(page).to have_content 'Start date'
        expect(page).to have_content 'End date'
        expect(page).to have_content 'Rate'
        expect(page).to have_content 'Max passengers'
        expect(page).to have_content 'Notes'

        fill_in 'ferry_date[rate]', with: '131313'
        page.find(:css, '.btn-primary').click

        visit '/admin/ferry_date'
        expect(page).not_to have_content '44444'
        expect(page).to have_content '131313'
      end
    end
  end
end
