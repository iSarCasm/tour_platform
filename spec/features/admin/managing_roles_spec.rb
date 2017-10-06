require 'rails_helper'

describe 'Managing Roles', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some Roles' do
      before do
        @role = create :role, name: 'Crazy one'
        create :role, name: 'Some basis'
        create :role, name: 'another one'
      end

      it 'can List all Roles' do
        visit '/admin/role'

        expect(page).to have_content 'Crazy one'
        expect(page).to have_content 'Some basis'
        expect(page).to have_content 'another one'
        expect(page).to have_content '4 roles'
      end

      it 'can Delete an Role' do
        visit "/admin/role/#{@role.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/role'

        expect(page).not_to have_content 'Crazy one'
        expect(page).to have_content 'Some basis'
        expect(page).to have_content 'another one'
        expect(page).to have_content '3 roles'
      end

      it 'can View the Role' do
        visit "/admin/role/#{@role.id}"
        expect(page).to have_content 'Name'
        expect(page).to have_content 'Crazy one'
      end

      it 'can Edit the Role' do
        visit "/admin/role/#{@role.id}/edit"
        expect(page).to have_content 'Name'
        expect(page).to have_content 'Description'

        fill_in 'role[name]', with: 'Wut face'
        page.find(:css, '.btn-primary').click

        visit '/admin/role'
        expect(page).not_to have_content 'Crazy one'
        expect(page).to have_content 'Wut face'
      end
    end
  end
end
