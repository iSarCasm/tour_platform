require 'rails_helper'

describe 'Managing Ferry Dates', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some ferry dates' do
      before do
        @ferry = create :ferry_date, notes: 'Ferry note one'
        create :ferry_date, notes: 'Ferry note two'
        create :ferry_date, notes: 'Ferry note three'
      end

      it 'can Add new one' do
        visit '/admin/ferry_date/new'
        expect(page).to have_content 'Save'
      end

      it 'can List all ferry dates' do
        visit '/admin/ferry_date'
        expect(page).to have_content 'Ferry note one'
        expect(page).to have_content 'Ferry note two'
        expect(page).to have_content 'Ferry note three'
      end

      it 'can Delete a ferry date' do
        visit "/admin/ferry_date/#{@ferry.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/ferry_date'
        expect(page).not_to have_content 'Ferry note one'
      end

      it 'can View the ferry date' do
        visit "/admin/ferry_date/#{@ferry.id}"

        expect(page).to have_content 'Notes'
        expect(page).to have_content 'Ferry note one'
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

        fill_in 'ferry_date[notes]', with: 'New NOTES'
        page.find(:css, '.btn-primary').click

        visit '/admin/ferry_date'
        expect(page).not_to have_content 'Ferry note one'
        expect(page).to have_content 'New NOTES'
      end
    end
  end
end
