require 'rails_helper'

describe 'Managing Payment Types', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some Payment Types' do
      before do
        @payment_type = create :payment_type, payment_type: 'Crazy one'
        create :payment_type, payment_type: 'Some basis'
        create :payment_type, payment_type: 'another one'
      end

      it 'can Add new one' do
        visit '/admin/payment_type/new'
        expect(page).to have_content 'Save'
      end

      it 'can List all Payment Types' do
        visit '/admin/payment_type'

        expect(page).to have_content 'Crazy one'
        expect(page).to have_content 'Some basis'
        expect(page).to have_content 'another one'
        expect(page).to have_content '3 payment types'
      end

      it 'can Delete an Payment type' do
        visit "/admin/payment_type/#{@payment_type.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/payment_type'

        expect(page).not_to have_content 'Crazy one'
        expect(page).to have_content 'Some basis'
        expect(page).to have_content 'another one'
        expect(page).to have_content '2 payment types'
      end

      it 'can View the Payment type' do
        visit "/admin/payment_type/#{@payment_type.id}"
        expect(page).to have_content 'Payment type'
        expect(page).to have_content 'Crazy one'
      end

      it 'can Edit the Payment type' do
        visit "/admin/payment_type/#{@payment_type.id}/edit"
        expect(page).to have_content 'Payment type'

        fill_in 'payment_type[payment_type]', with: 'Wut face'
        page.find(:css, '.btn-primary').click

        visit '/admin/payment_type'
        expect(page).not_to have_content 'Crazy one'
        expect(page).to have_content 'Wut face'
      end
    end
  end
end
