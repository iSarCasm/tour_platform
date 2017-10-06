require 'rails_helper'

describe 'Sign in', type: :feature do
  context 'with valid credentials' do
    before do
      create :user, email: 'jackdaniels@gmail.com', password: '123456'
    end

    it 'allows user to sign in' do
      visit '/users/sign_in'

      expect(page).to have_content 'Sign In'

      fill_in 'Email', with: 'jackdaniels@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Sign in'

      expect(page).to have_content 'Signed in successfully.'
    end
  end

  context 'with invalid credentials' do
    it 'denies user from signing in' do
      visit '/users/sign_in'

      expect(page).to have_content 'Sign In'

      fill_in 'Email', with: 'jackdaniels@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Sign in'

      expect(page).to have_content 'Invalid Email or password.'
      expect(page).not_to have_content 'Signed in successfully.'
    end
  end
end
