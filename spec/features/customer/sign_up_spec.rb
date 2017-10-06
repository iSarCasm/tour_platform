require 'rails_helper'

describe 'Sign up', type: :feature do
  it 'allows user to registrate and notifies of success' do
    visit '/users/sign_up'

    expect(page).to have_content 'Sign Up'

    fill_in 'Name', with: 'Jack Daniels'
    fill_in 'Email', with: 'jackdaniels@gmail.com'
    fill_in 'Password', with: 'secure_password'
    fill_in 'Password confirmation', with: 'secure_password'
    click_button 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  context 'when email is taken' do
    before do
      create :user, email: 'jackdaniels@gmail.com'
    end

    it 'denies from signing up and notifies of email duplicate' do
      visit '/users/sign_up'

      expect(page).to have_content 'Sign Up'

      fill_in 'Name', with: 'Jack Daniels'
      fill_in 'Email', with: 'jackdaniels@gmail.com'
      fill_in 'Password', with: 'secure_password'
      fill_in 'Password confirmation', with: 'secure_password'
      click_button 'Sign up'

      expect(page).to have_content 'Email has already been taken'
      expect(page).not_to have_content 'Welcome! You have signed up successfully.'
    end
  end
end
