require 'rails_helper'

describe 'Accessing Admin Dashboard Page', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'when logged in as Admin' do
    before do
      user = create :user, base_role: :admin
      sign_in user
    end

    it 'loads Dashboard page' do
      visit '/admin'
      expect(page).to have_content 'Tour Platform'
      expect(page).to have_content 'Site Administration'
      expect(page).to have_content 'Dashboard'
    end
  end

  context 'when not an Admin' do
    it 'doesnt show the Admin panel' do
      visit '/admin'
      expect(page).not_to have_content 'Site Administration'
      expect(page).not_to have_content 'Dashboard'
    end
  end
end
