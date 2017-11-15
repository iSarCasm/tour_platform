require 'rails_helper'

describe 'Managing Permissions', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some Permissions' do
      before do
        @permission = create :permission, action: :read
        create :permission, action: :add
        create :permission, action: :export
      end

      it 'can Add new one' do
        visit '/admin/permission/new'
        expect(page).to have_content 'Save'
      end

      it 'can List all Permissions' do
        visit '/admin/permission'

        expect(page).to have_content 'read'
        expect(page).to have_content 'export'
        expect(page).to have_content 'add'
        expect(page).to have_content '4 permissions'
        # 1 extra for superadmin user
      end

      it 'can Delete an Permission' do
        visit "/admin/permission/#{@permission.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/permission'

        expect(page).not_to have_content 'read'
        expect(page).to have_content 'add'
        expect(page).to have_content 'export'
        expect(page).to have_content '3 permissions'
      end

      it 'can View the Permission' do
        visit "/admin/permission/#{@permission.id}"
        expect(page).to have_content 'Action'
        expect(page).to have_content 'read'
      end

      it 'can Edit the Permission' do
        visit "/admin/permission/#{@permission.id}/edit"
        expect(page).to have_content 'Action'

        select 'remove', from: 'permission[action]'
        page.find(:css, '.btn-primary').click

        visit '/admin/permission'
        expect(page).not_to have_content 'read'
        expect(page).to have_content 'remove'
      end
    end
  end
end
