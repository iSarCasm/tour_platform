require 'rails_helper'

describe 'Managing Pickup lists', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some Pickup lists' do
      before do
        @pickup_list = create :pickup_list
        create :pickup_list
        create :pickup_list
      end

      it 'can Add new one' do
        visit '/admin/pickup_list/new'
        expect(page).to have_content 'Save'
      end

      it 'can List all Pickup lists' do
        visit '/admin/pickup_list'
        expect(page).to have_content '3 pickup lists'
      end

      it 'can Delete an Pickup List' do
        visit "/admin/pickup_list/#{@pickup_list.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/pickup_list'
        expect(page).to have_content '2 pickup lists'
      end

      it 'can View the Pickup List' do
        visit "/admin/pickup_list/#{@pickup_list.id}"
        expect(page).to have_content 'Tour coach'
      end

      it 'can Edit the Pickup List' do
        visit "/admin/pickup_list/#{@pickup_list.id}/edit"
        expect(page).to have_content 'Tour coach'
      end
    end
  end
end
