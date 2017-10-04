require 'rails_helper'

describe 'Managing Board Bases', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some Board Bases' do
      before do
        @board_basis = create :board_basis, title: 'Crazy one'
        create :board_basis, title: 'Some basis'
        create :board_basis, title: 'another one'
      end

      it 'can List all Board Bases' do
        visit '/admin/board_basis'

        expect(page).to have_content 'Crazy one'
        expect(page).to have_content 'Some basis'
        expect(page).to have_content 'another one'
        expect(page).to have_content '3 board bases'
      end

      it 'can Delete an Board Basis' do
        visit "/admin/board_basis/#{@board_basis.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/board_basis'

        expect(page).not_to have_content 'Crazy one'
        expect(page).to have_content 'Some basis'
        expect(page).to have_content 'another one'
        expect(page).to have_content '2 board bases'
      end

      it 'can View the Board Basis' do
        visit "/admin/board_basis/#{@board_basis.id}"
        expect(page).to have_content 'Title'
        expect(page).to have_content 'Crazy one'
      end

      it 'can Edit the Board Basis' do
        visit "/admin/board_basis/#{@board_basis.id}/edit"
        expect(page).to have_content 'Title'

        fill_in 'board_basis[title]', with: 'Wut face'
        page.find(:css, '.btn-primary').click

        visit '/admin/board_basis'
        expect(page).not_to have_content 'Crazy one'
        expect(page).to have_content 'Wut face'
      end
    end
  end
end
