require 'rails_helper'

describe 'Managing Ferries', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some ferryes' do
      before do
        @ferry = create :ferry, title: 'Sample ferry 1'
        create :ferry, title: 'Very fast ferry'
        create :ferry, title: 'Train ferry wtf?'
      end

      it 'can Add new one' do
        visit '/admin/ferry/new'
        expect(page).to have_content 'Save'
      end

      it 'can List all ferryes' do
        visit '/admin/ferry'
        expect(page).to have_content 'Sample ferry 1'
        expect(page).to have_content 'Very fast ferry'
        expect(page).to have_content 'Train ferry wtf?'
      end

      it 'can Delete a ferry' do
        visit "/admin/ferry/#{@ferry.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/ferry'
        expect(page).not_to have_content 'Sample ferry 1'
      end

      it 'can View the ferry' do
        visit "/admin/ferry/#{@ferry.id}"

        expect(page).to have_content 'Title'
        expect(page).to have_content 'Sample ferry 1'
      end

      it 'can Edit the ferry' do
        visit "/admin/ferry/#{@ferry.id}/edit"
        expect(page).to have_content 'Title'
        expect(page).to have_content 'Description'
        expect(page).to have_content 'Address'
        expect(page).to have_content 'Phone'
        expect(page).to have_content 'Fax'
        expect(page).to have_content 'Website'
        expect(page).to have_content 'Email'
        expect(page).to have_content 'Contact name'
        expect(page).to have_content 'Emergency number'
        expect(page).to have_content 'Notes'

        fill_in 'ferry[title]', with: 'New Title of This FERRY'
        page.find(:css, '.btn-primary').click

        visit '/admin/ferry'
        expect(page).not_to have_content 'Sample ferry 1'
        expect(page).to have_content 'New Title of This FERRY'
      end
    end
  end
end
