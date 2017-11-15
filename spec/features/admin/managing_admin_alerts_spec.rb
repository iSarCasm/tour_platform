require 'rails_helper'

describe 'Managing Admin Alerts', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some Admin Alerts' do
      before do
        @admin_alert = create :admin_alert, title: 'Crazy alert!'
        create :admin_alert, title: 'Some alert'
        create :admin_alert, title: 'another one'
      end

      it 'can Add new one' do
        visit '/admin/admin_alert/new'
        expect(page).to have_content 'Save'
      end

      it 'can List all Admin Alerts' do
        visit '/admin/admin_alert'

        expect(page).to have_content 'Crazy alert!'
        expect(page).to have_content 'Some alert'
        expect(page).to have_content 'another one'
        expect(page).to have_content '3 admin alerts'
      end

      it 'can Delete an Photo' do
        visit "/admin/admin_alert/#{@admin_alert.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/admin_alert'

        expect(page).not_to have_content 'Crazy alert!'
        expect(page).to have_content 'Some alert'
        expect(page).to have_content 'another one'
        expect(page).to have_content '2 admin alerts'
      end

      it 'can View the Photo' do
        visit "/admin/admin_alert/#{@admin_alert.id}"
        expect(page).to have_content 'Title'
        expect(page).to have_content 'Crazy alert!'
      end

      it 'can Edit the Photo' do
        visit "/admin/admin_alert/#{@admin_alert.id}/edit"
        expect(page).to have_content 'Title'
        expect(page).to have_content 'Content'
        expect(page).to have_content 'Read'
        expect(page).to have_content 'User'

        fill_in 'admin_alert[title]', with: 'Wut face'
        page.find(:css, '.btn-primary').click

        visit '/admin/admin_alert'
        expect(page).not_to have_content 'Crazy alert!'
        expect(page).to have_content 'Wut face'
      end
    end
  end
end
