require 'rails_helper'

describe 'Managing Seatplans', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some Seatplans' do
      before do
        @seatplan = create :seatplan, title: 'PC 90'
        create :seatplan, title: 'Yoyo 13'
        create :seatplan, title: 'OK-133'
      end

      it 'can Add new one' do
        visit '/admin/seatplan/new'
        expect(page).to have_content 'Save'
      end

      it 'can List all Seatplans' do
        visit '/admin/seatplan'

        expect(page).to have_content 'PC 90'
        expect(page).to have_content 'Yoyo 13'
        expect(page).to have_content 'OK-133'
        expect(page).to have_content '3 seatplans'
      end

      it 'can Delete an Seatplan' do
        visit "/admin/seatplan/#{@seatplan.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/seatplan'

        expect(page).not_to have_content 'PC 90'
        expect(page).to have_content 'Yoyo 13'
        expect(page).to have_content 'OK-133'
        expect(page).to have_content '2 seatplans'
      end

      it 'can View the Seatplan' do
        visit "/admin/seatplan/#{@seatplan.id}"
        expect(page).to have_content 'Title'
        expect(page).to have_content 'PC 90'
      end

      it 'can Edit the Seatplan' do
        visit "/admin/seatplan/#{@seatplan.id}/edit"
        expect(page).to have_content 'Title'
        expect(page).to have_content 'Description'
        expect(page).to have_content 'Plan'

        fill_in 'seatplan[title]', with: 'Biz'
        page.find(:css, '.btn-primary').click

        visit '/admin/seatplan'
        expect(page).not_to have_content 'PC 90'
        expect(page).to have_content 'Biz'
      end
    end
  end
end
