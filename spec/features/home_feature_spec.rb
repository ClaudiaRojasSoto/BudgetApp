require 'rails_helper'

RSpec.feature 'Home', type: :feature do
  scenario 'User visits the home page' do
    visit root_path
    expect(page).to have_content('BudgeTracker')
  end

  scenario 'User visits the start page' do
    visit home_start_path
    expect(page).to have_content('WELCOME!!')
  end
end
