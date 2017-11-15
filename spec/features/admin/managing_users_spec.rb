require 'rails_helper'

describe 'Managing Users', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some Users' do
      before do
        @user = create :user, name: 'D. Trump'
        create :user, name: 'B. Obama'
        create :user, name: 'V. Putin'
      end

      it 'can Add new one' do
        visit '/admin/user/new'
        expect(page).to have_content 'Save'
      end

      it 'can List all Users' do
        visit '/admin/user'
        expect(page).to have_content 'D. Trump'
        expect(page).to have_content 'B. Obama'
        expect(page).to have_content 'V. Putin'
      end

      it 'can Delete an User' do
        visit "/admin/user/#{@user.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/user'
        expect(page).not_to have_content 'D. Trump'
        expect(page).to have_content 'B. Obama'
        expect(page).to have_content 'V. Putin'
      end

      it 'can View the User' do
        visit "/admin/user/#{@user.id}"
        expect(page).to have_content 'Name'
        expect(page).to have_content 'D. Trump'
      end

      it 'can Edit the User' do
        visit "/admin/user/#{@user.id}/edit"

        expect(page).to have_content 'Title'
        expect(page).to have_content 'Name'
        expect(page).to have_content 'Email'
        expect(page).to have_content 'Role'
        expect(page).to have_content 'Base role'
        expect(page).to have_content 'Address'
        expect(page).to have_content 'Postcode'
        expect(page).to have_content 'Passport name'
        expect(page).to have_content 'Passport no'
        expect(page).to have_content 'Passport date of birth'
        expect(page).to have_content 'Phone mobile'
        expect(page).to have_content 'Phone landline'
        expect(page).to have_content 'Phone evening'
        expect(page).to have_content 'Marketing'
        expect(page).to have_content 'Kin name'
        expect(page).to have_content 'Kin phone'
        expect(page).to have_content 'Travel club'
        expect(page).to have_content 'Member no'

        fill_in 'user[name]', with: 'Jack Daniels'
        page.find(:css, '.btn-primary').click

        visit '/admin/user'
        expect(page).not_to have_content 'D. Trump'
        expect(page).to have_content 'Jack Daniels'
      end
    end
  end
end
