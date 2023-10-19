require 'rails_helper'

RSpec.feature 'Home', type: :feature do
  scenario 'User visits the home page' do
    visit root_path
    expect(page).to have_content('BudgeTracker')
  end
end
