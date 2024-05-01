# frozen_string_literal: true

# spec/system/user_registration_spec.rb

require 'rails_helper'

RSpec.describe 'User Registration', type: :system do
  it 'allows a user to register and sign in' do
    visit new_user_registration_path

    # Fill in the registration form
    fill_in 'user_email', with: 'test@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'

    # Ensure the user is redirected to the sign-in page after registration
    expect(page).to have_current_path(root_path)
  end

  it 'allows a user to sign in' do
    visit new_user_session_path

    # Fill in the sign-in form
    fill_in 'user_email', with: 'test@example.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'

    # Ensure the user is redirected to the home page after sign-in
    expect(page).to have_current_path(new_user_session_path)
  end
end
