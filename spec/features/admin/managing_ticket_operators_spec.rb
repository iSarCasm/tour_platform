require 'rails_helper'

describe 'Managing Ticket Operators', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      sign_in create(:superadmin)
    end

    context 'with some ticket operators' do
      before do
        @ticket_operator = create :ticket_operator, title: 'Sample ticket operator 1'
        create :ticket_operator, title: 'Very fast ticket operator'
        create :ticket_operator, title: 'Train ticket operator wtf?'
      end

      it 'can Add new one' do
        visit '/admin/ticket_operator/new'
        expect(page).to have_content 'Save'
      end

      it 'can List all ticket operators' do
        visit '/admin/ticket_operator'
        expect(page).to have_content 'Sample ticket operator 1'
        expect(page).to have_content 'Very fast ticket operator'
        expect(page).to have_content 'Train ticket operator wtf?'
      end

      it 'can Delete a ticket operator' do
        visit "/admin/ticket_operator/#{@ticket_operator.id}/delete"
        page.find(:css, '.btn-danger').click
        visit '/admin/ticket_operator'
        expect(page).not_to have_content 'Sample ticket operator 1'
      end

      it 'can View the ticket_operator' do
        visit "/admin/ticket_operator/#{@ticket_operator.id}"

        expect(page).to have_content 'Title'
        expect(page).to have_content 'Sample ticket operator 1'
      end

      it 'can Edit the ticket_operator' do
        visit "/admin/ticket_operator/#{@ticket_operator.id}/edit"
        expect(page).to have_content 'Title'
        expect(page).to have_content 'Description'
        expect(page).to have_content 'Address'
        expect(page).to have_content 'Phone number'
        expect(page).to have_content 'Fax number'
        expect(page).to have_content 'Website'
        expect(page).to have_content 'Email'
        expect(page).to have_content 'Buyer name'
        expect(page).to have_content 'Buyer number'
        expect(page).to have_content 'Photos'
        expect(page).to have_content 'Stock'
        expect(page).to have_content 'Adult Buy'
        expect(page).to have_content 'Adult Sell'
        expect(page).to have_content 'Senior Buy'
        expect(page).to have_content 'Senior Sell'
        expect(page).to have_content 'Infant Buy'
        expect(page).to have_content 'Infant Sell'
        expect(page).to have_content 'Child Buy'
        expect(page).to have_content 'Child Sell'

        fill_in 'ticket_operator[title]', with: 'New Title of This Ticket OPERATOR'
        page.find(:css, '.btn-primary').click

        visit '/admin/ticket_operator'
        expect(page).not_to have_content 'Sample ticket operator 1'
        expect(page).to have_content 'New Title of This Ticket OPERATOR'
      end
    end
  end
end
