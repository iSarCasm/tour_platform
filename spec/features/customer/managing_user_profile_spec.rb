require 'rails_helper'

describe 'Managing User Profile', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in' do
    before do
      @user = create :user, email: 'user@g.co', name: 'Jack'
      @booking = create :tour_booking, user: @user
      sign_in @user
    end

    it 'shows all required info' do
      visit '/users/edit'

      expect(page).to have_content @user.name

      expect(page).to have_content 'Bookings list:'
      expect(page).to have_content @booking.title

      expect(page).to have_content 'Edit User'

      expect(page).to have_content 'Cancel my account'
    end
  end

  context 'when a guest' do
    it 'shows all required info' do

    end
  end
end
