require 'rails_helper'

RSpec.feature 'User Authentication', type: :feature do
  scenario 'User registers and logs in' do
    visit new_user_registration_path

    fill_in 'Full Name', with: 'John Doe'
    fill_in 'user[email]', with: 'johndoe@example.com'
    fill_in 'user[password]', with: 'password123'
    fill_in 'user[password_confirmation]', with: 'password123'

    click_button 'Sign up'

    expect(current_path).to eq(categories_path)
  end
end
